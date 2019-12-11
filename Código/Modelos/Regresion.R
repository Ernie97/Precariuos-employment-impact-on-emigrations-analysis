rm(list = ls())
gc()


load(file = "Contratos.RData")
load(file = "Empleo.RData")
load(file = "Emigraciones.RData")



cor(emigraciones$totalEdades,empleo$total)


plot(emigraciones$totalEdades, xaxt="n", ylab="emigraciones", xlab="")
axis(1, labels=emigraciones$semestres, at=1:10, las=3)


plot(empleo$total, xaxt="n", ylab="emigraciones", xlab="")
axis(1, labels=emigraciones$semestres, at=1:10, las=3)


plot(empleo$total, emigraciones$totalEdades)

fit <- lm(emigraciones$totalEdades ~ empleo$total)
fit

#Dibuja linea de ajuste de prediccion
abline(fit)

attributes(fit)

fit$coefficients

residuals(fit)

summary(fit)

layout(matrix(c(1,2,3,4),2,2)) # 4 gr?ficos por ventana 

plot(fit)

layout(matrix(1))

predict(fit, data.frame(3000))[1]

if (!require(scatterplot3d)) {install.packages("scatterplot3d", dependencies = TRUE)}
# Se carga en memoria
#library(scatterplot3d)
require(scatterplot3d)

s3d <- scatterplot3d(emigraciones$totalEdades, empleo$total, highlight.3d=T, type="h", lab=c(2,3)) # Pinta la "estructura".
s3d$plane3d(fit)


(emigraciones2013 <- fit$coefficients[[1]] + fit$coefficients[[2]]*2013)


data2013 <- data.frame(year=2013)
cpi2013 <- predict(fit, newdata=data2013)
style <- c(rep(1,10), rep(2,4))
plot(c(emigraciones$totalEdades, cpi2013), xaxt="n", ylab="Emigracione", xlab="", pch=style, col=style)
axis(1, at=1:16, las=3,
     labels=c(paste(year,quarter,sep="Q"), "2011Q1", "2011Q2", "2011Q3", "2011Q4"))

