if (!require("XLConnect")) 
  install.packages("XLConnect")
library(XLConnect)


ficherosExcelEmpleosS1 <- c("ESTADISTICA_DE_EMPLEO.xls","ESTADISTICA_DE_EMPLEO (1).xls","ESTADISTICA_DE_EMPLEO (2).xls",
                            "ESTADISTICA_DE_EMPLEO (3).xls","ESTADISTICA_DE_EMPLEO (4).xls","ESTADISTICA_DE_EMPLEO (5).xls")

ficherosExcelEmpleosS2 <- c("ESTADISTICA_DE_EMPLEO (6).xls","ESTADISTICA_DE_EMPLEO (7).xls","ESTADISTICA_DE_EMPLEO (8).xls",
                            "ESTADISTICA_DE_EMPLEO (9).xls","ESTADISTICA_DE_EMPLEO (10).xls","ESTADISTICA_DE_EMPLEO (11).xls")


totalsem <- c(0,0,0,0,0)
totalParadossem <- c(0,0,0,0)
totalNoParadossem <- c(0,0,0,0)
for(myExcelFile in ficherosExcelEmpleosS1){
  myExcelFileContent <- loadWorkbook(myExcelFile)
  myExcelFIleFirstSheet<-readWorksheet(myExcelFileContent, sheet="1.1")
  content <- na.omit(myExcelFIleFirstSheet)
  edades <- as.character(strsplit(content$Col1[2:5]," ' '"))
  total <- strsplit(content$Col2[2:5]," ' '")
  for (i in 1:4){
    total[[i]] <- gsub("[.]", "", total[[i]])
    totalsem[i] <- as.double(totalsem[i])+ as.double(total[i])
  }
  
}
totalsem <- round(totalsem/6)
totaltotal <- sum(totalsem)
edades[5]<- "TODAS LAS EDADES"
totalsem[5] <- totaltotal
semestre1año2008 <- data.frame(edades, totalsem)


totalsem <- c(0,0,0,0,0)
totalParadossem <- c(0,0,0,0)
totalNoParadossem <- c(0,0,0,0)
for(myExcelFile in ficherosExcelEmpleosS2){
  myExcelFileContent <- loadWorkbook(myExcelFile)
  myExcelFIleFirstSheet<-readWorksheet(myExcelFileContent, sheet="1.1")
  content <- na.omit(myExcelFIleFirstSheet)
  edades <- as.character(strsplit(content$Col1[2:5]," ' '"))
  total <- strsplit(content$Col2[2:5]," ' '")
  for (i in 1:4){
    total[[i]] <- gsub("[.]", "", total[[i]])
    totalsem[i] <- as.double(totalsem[i])+ as.double(total[i])
  }
  
}
totalsem <- round(totalsem/6)
totaltotal <- sum(totalsem)
edades[5]<- "TODAS LAS EDADES"
totalsem[5] <- totaltotal
semestre2año2008 <- data.frame(edades, totalsem)
save(semestre1año2008, semestre2año2008, file="Empleo2008.RData")