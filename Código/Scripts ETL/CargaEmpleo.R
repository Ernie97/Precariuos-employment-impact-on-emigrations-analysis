load(file = "Empleo2008.RData")
load(file = "Empleo2009.RData")
load(file = "Empleo2010.RData")
load(file = "Empleo2011.RData")
load(file = "Empleo2012.RData")



veinte <- c(0,0,0,0,0,0,0,0,0,0)
veinticinco <- c(0,0,0,0,0,0,0,0,0,0)
treinta <- c(0,0,0,0,0,0,0,0,0,0)
treintaicinco <- c(0,0,0,0,0,0,0,0,0,0)
total <- c(0,0,0,0,0,0,0,0,0,0)
j <- 0
totalEmpleo <- data.frame(semestre1año2008, semestre2año2008,semestre1año2009, semestre2año2009, semestre1año2010, semestre2año2010, semestre1año2011, semestre2año2011, semestre1año2012, semestre2año2012)
for (i in 1:10){
  j <- i*2
  veinte[i] <- totalEmpleo[1,j]
  veinticinco[i] <- totalEmpleo[2,j]
  treinta[i] <-  totalEmpleo[3,j]
  treintaicinco[i] <- totalEmpleo[4,j]
  total[i] <- totalEmpleo[5,j]
}

semestres <- c("S1A2008", "S2A2008","S1A2009", "S2A2009","S1A2010", "S2A2010","S1A2011", "S2A2011","S1A2012", "S2A2012")
empleo <- data.frame(semestres,veinte, veinticinco, treinta, treintaicinco, total)
save(empleo, file="Empleo.RData")
