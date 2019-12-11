load(file = "Contratos2008.RData")
load(file = "Contratos2009.RData")
load(file = "Contratos2010.RData")
load(file = "Contratos2011.RData")
load(file = "Contratos2012.RData")



indefinido_ordinario <- c(0,0,0,0,0,0,0,0,0,0)
indefinido_fomento <- c(0,0,0,0,0,0,0,0,0,0)
obra_o_servicio <- c(0,0,0,0,0,0,0,0,0,0)
eventual_circunstancias <- c(0,0,0,0,0,0,0,0,0,0)
total <- c(0,0,0,0,0,0,0,0,0,0)
j <- 0
totalContratos <- data.frame(semestre1año2008Cont, semestre2año2008Cont,semestre1año2009Cont, semestre2año2009Cont, semestre1año2010Cont, semestre2año2010Cont,
                             semestre1año2011Cont, semestre2año2011Cont, semestre1año2012Cont, semestre2año2012Cont)
for (i in 1:10){
  j <- i*2
  indefinido_ordinario[i] <- totalContratos[1,j]
  indefinido_fomento[i] <- totalContratos[2,j]
  obra_o_servicio[i] <-  totalContratos[3,j]
  eventual_circunstancias[i] <- totalContratos[4,j]
  total[i] <- totalContratos[5,j]
}

semestres <- c("S1A2008", "S2A2008","S1A2009", "S2A2009","S1A2010", "S2A2010","S1A2011", "S2A2011","S1A2012", "S2A2012")
Contratos <- data.frame(semestres,indefinido_ordinario, indefinido_fomento, obra_o_servicio, eventual_circunstancias, total)
save(Contratos, file="Contratos.RData")
