if (!require("XLConnect")) 
  install.packages("XLConnect")
library(XLConnect)


myExcelFile = "migracionesINE.xls"
myExcelFileContent <- loadWorkbook(myExcelFile)
myExcelFileSheetNames <- getSheets(myExcelFileContent)
myExcelFIleFirstSheet<-readWorksheet(myExcelFileContent, myExcelFileSheetNames[1])
content <- na.omit(myExcelFIleFirstSheet)

aux1 <- 0
aux2 <- 0
aux3 <- 0
aux4 <- 0

veinteA24 <- c()
veinticincoA29 <- c()
treintaA34 <- c()
treintaycincoA39 <- c()
z <- 0

for(j in 2:11){
  aux1 <- 0
  aux2 <- 0
  aux3 <- 0
  aux4 <- 0
  for (i in 2:6){
    z <- i +5
    content[[j]][i] <- gsub("[.]", "", content[[j]][i])
    content[[j]][i+5] <- gsub("[.]", "", content[[j]][i+5])
    content[[j]][i+10] <- gsub("[.]", "", content[[j]][i+10])
    content[[j]][i+15] <- gsub("[.]", "", content[[j]][i+15])
    aux1 <- aux1 + as.double(content[[j]][i])
    aux2 <- aux2 + as.double(content[[j]][i+5])
    aux3 <- aux3 + as.double(content[[j]][i+10])
    aux4 <- aux4 + as.double(content[[j]][i+15])
  }
  veinteA24 <- append(veinteA24,aux1)
  veinticincoA29 <- append(veinticincoA29,aux2)
  treintaA34 <- append(treintaA34,aux3)
  treintaycincoA39 <- append(treintaycincoA39,aux4)
  
}
semestres <- c("2008S1","2008S2","2009S1","2009S2","2010S1","2010S2","2011S1","2011S2","2012S1","2012S2")
#emigraciones <- cbind(semestres, veinteA24, veinticincoA29, treintaA34, treintaycincoA39)
totalEdades <- (veinteA24+veinticincoA29+treintaA34+treintaycincoA39)
emigraciones <- data.frame(semestres, veinteA24, veinticincoA29, treintaA34, treintaycincoA39,totalEdades)
save(emigraciones, file="Emigraciones.RData")
