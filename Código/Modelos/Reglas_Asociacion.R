rm(list = ls())
gc()


load(file = "ContratosDiscretizados.RData")
load(file = "EmpleoDiscretizado.RData")
load(file = "emigracionesDiscretizado.RData")

df <- data.frame(contratosDiscretizados$contratosTotal, empleoDiscretizado$empleoTotal, emigracionesDiscretizado$emigracionesTotal)
if (!require(arules)) {install.packages("arules", dependencies = TRUE)}
# Se carga en memoria
require(arules) #library(arules)


rules.all <- apriori(df)

rules.all
inspect(rules.all)

rules <- apriori(df, control = list(verbose=F),
                 parameter = list(minlen=2, supp=0.005, conf=0.8),
                 appearance = list(rhs=c("emigracionesDiscretizado.emigracionesTotal=Muy bajo", "emigracionesDiscretizado.emigracionesTotal=Muy Alto", "emigracionesDiscretizado.emigracionesTotal=Normal", "emigracionesDiscretizado.emigracionesTotal=Alto", "emigracionesDiscretizado.emigracionesTotal=Bajo"),
                                   default="lhs"))
quality(rules) <- round(quality(rules), digits=3)

rules.sorted <- sort(rules, by="lift")
inspect(rules.sorted)

subset.matrix <- is.subset(rules.sorted, rules.sorted, sparse=FALSE)
subset.matrix[lower.tri(subset.matrix, diag=T)]  <- NA
subset.matrix
redundant <- colSums(subset.matrix, na.rm=T) >= 1
which(redundant)

rules.pruned <- rules.sorted[!redundant]
inspect(rules.pruned)
