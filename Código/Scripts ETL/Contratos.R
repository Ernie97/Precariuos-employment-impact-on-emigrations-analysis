if (!require("XLConnect")) 
  install.packages("XLConnect")
library(XLConnect)

rm(list=ls())

ficherosExcelContratosSemestre1 <- c("ESTADISTICA_DE_CONTRATOS_MES.xls","ESTADISTICA_DE_CONTRATOS_MES(1).xls","ESTADISTICA_DE_CONTRATOS_MES(2).xls",
                                 "ESTADISTICA_DE_CONTRATOS_MES(3).xls","ESTADISTICA_DE_CONTRATOS_MES(4).xls","ESTADISTICA_DE_CONTRATOS_MES(5).xls")

ficherosExcelContratosSemestre2 <- c("ESTADISTICA_DE_CONTRATOS_MES(6).xls", "ESTADISTICA_DE_CONTRATOS_MES(7).xls","ESTADISTICA_DE_CONTRATOS_MES(8).xls",
                                     "ESTADISTICA_DE_CONTRATOS_MES(9).xls","ESTADISTICA_DE_CONTRATOS_MES(10).xls","ESTADISTICA_DE_CONTRATOS_MES(11).xls")
veintea24sem <- c(0,0,0,0)
veinticincoa29sem <- c(0,0,0,0)
treintaa34sem <- c(0,0,0,0)
treintaycincoA39sem <- c(0,0,0,0)

for (myExcelFile in ficherosExcelContratosSemestre1){
  myExcelFileContent <- loadWorkbook(myExcelFile)
  myExcelFileFirstSheet<-readWorksheet(myExcelFileContent, sheet="2.1")
  myExcelFileFirstSheet <- na.omit(myExcelFileFirstSheet)
  tipoContrato <- strsplit(myExcelFileFirstSheet$Col1[c(1,2,4,5,30)]," ' '")
  tipoContrato <- as.character(tipoContrato)
  veinteA24 <- strsplit(myExcelFileFirstSheet$Col4[c(1,2,4,5)]," ' '")
  veinticincoA29 <- strsplit(myExcelFileFirstSheet$Col5[c(1,2,4,5)]," ' '")
  treintaA34 <- strsplit(myExcelFileFirstSheet$Col6[c(1,2,4,5,30)]," ' '")
  treintaycincoA39 <- strsplit(myExcelFileFirstSheet$Col7[c(1,2,4,5)]," ' '")
  for (i in 1:4){
    veinteA24[i] <- gsub("[.]", "", veinteA24[[i]])
    if (veinteA24[i] == " "){
      veinteA24[i] <- "0"
    }
    veinticincoA29[i] <-gsub("[.]", "", veinticincoA29[[i]])
    if (veinticincoA29[i] == " "){
      veinticincoA29[i] <- "0"
    }
    treintaA34[i] <- gsub("[.]", "", treintaA34[[i]])
    if (treintaA34[i] == " "){
      treintaA34[i] <- "0"
    }
    treintaycincoA39[i] <- gsub("[.]", "", treintaycincoA39[[i]])
    if (treintaycincoA39[i] == " "){
      treintaycincoA39[i] <- "0"
    }
    veintea24sem[i] <- as.double(veintea24sem[i])+ as.double(veinteA24[i])
    veinticincoa29sem[i] <- as.double(veinticincoa29sem[i])+ as.double(veinticincoA29[i])
    treintaa34sem[i] <- as.double(treintaa34sem[i])+ as.double(treintaA34[i])
    treintaycincoA39sem[i] <- as.double(treintaycincoA39sem[i])+ as.double(treintaycincoA39[i])
  }
}


totaledades <- veintea24sem + veinticincoa29sem + treintaa34sem + treintaycincoA39sem
totaledades <- round(totaledades/6)
totaledades[5] <- sum(totaledades)
semestre1año2012Cont  <- data.frame(tipoContrato,totaledades)

for (myExcelFile in ficherosExcelContratosSemestre2){
  myExcelFileContent <- loadWorkbook(myExcelFile)
  myExcelFileFirstSheet<-readWorksheet(myExcelFileContent, sheet="2.1")
  myExcelFileFirstSheet <- na.omit(myExcelFileFirstSheet)
  veinteA24 <- strsplit(myExcelFileFirstSheet$Col4[c(1,2,4,5)]," ' '")
  veinticincoA29 <- strsplit(myExcelFileFirstSheet$Col5[c(1,2,4,5)]," ' '")
  treintaA34 <- strsplit(myExcelFileFirstSheet$Col6[c(1,2,4,5)]," ' '")
  treintaycincoA39 <- strsplit(myExcelFileFirstSheet$Col7[c(1,2,4,5)]," ' '")
  for (i in 1:4){
    veinteA24[i] <- gsub("[.]", "", veinteA24[[i]])
    if (veinteA24[i] == " "){
      veinteA24[i] <- "0"
    }
    veinticincoA29[i] <-gsub("[.]", "", veinticincoA29[[i]])
    if (veinticincoA29[i] == " "){
      veinticincoA29[i] <- "0"
    }
    treintaA34[i] <- gsub("[.]", "", treintaA34[[i]])
    if (treintaA34[i] == " "){
      treintaA34[i] <- "0"
    }
    treintaycincoA39[i] <- gsub("[.]", "", treintaycincoA39[[i]])
    if (treintaycincoA39[i] == " "){
      treintaycincoA39[i] <- "0"
    }
    veintea24sem[i] <- as.double(veintea24sem[i])+ as.double(veinteA24[i])
    veinticincoa29sem[i] <- as.double(veinticincoa29sem[i])+ as.double(veinticincoA29[i])
    treintaa34sem[i] <- as.double(treintaa34sem[i])+ as.double(treintaA34[i])
    treintaycincoA39sem[i] <- as.double(treintaycincoA39sem[i])+ as.double(treintaycincoA39[i])
  }
}

totaledades <- veintea24sem + veinticincoa29sem + treintaa34sem + treintaycincoA39sem
totaledades <- round(totaledades/6)
totaledades[5] <- sum(totaledades)
semestre2año2012Cont <- data.frame(tipoContrato,totaledades)



save(semestre1año2012Cont,semestre2año2012Cont,file="Contratos2012.RData")


