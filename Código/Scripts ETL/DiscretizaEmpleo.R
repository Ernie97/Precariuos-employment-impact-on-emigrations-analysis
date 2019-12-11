load("Empleo.RData")

discretizaEmpleo20 <- function(x){
  if (x < 425389){
    "Muy bajo"
  }
  else if (x < 457346){
    "Bajo"
  }
  else if (x < 473075){
    "Normal"
  }
  else if (x < 480369){
    "Alto"
  }
  else {
    "Muy Alto"
  }
}

discretizaEmpleo25 <- function(x){
  if (x < 586825){
    "Muy bajo"
  }
  else if (x < 638627){
    "Bajo"
  }
  else if (x < 646800){
    "Normal"
  }
  else if (x < 660900){
    "Alto"
  }
  else {
    "Muy Alto"
  }
}

discretizaEmpleo30 <- function(x){
  if (x < 658366){
    "Muy bajo"
  }
  else if (x < 758795){
    "Bajo"
  }
  else if (x < 777440){
    "Normal"
  }
  else if (x < 796858){
    "Alto"
  }
  else {
    "Muy Alto"
  }
}

discretizaEmpleo35 <- function(x){
  if (x < 612564){
    "Muy bajo"
  }
  else if (x < 733337){
    "Bajo"
  }
  else if (x < 765429){
    "Normal"
  }
  else if (x < 805981){
    "Alto"
  }
  else {
    "Muy Alto"
  }
}

discretizaEmpleoTotal <- function(x){
  if (x < 2283142){
    "Muy bajo"
  }
  else if (x < 2591157){
    "Bajo"
  }
  else if (x < 2681601){
    "Normal"
  }
  else if (x < 2732025){
    "Alto"
  }
  else {
    "Muy Alto"
  }
}

empleo20 <- c()
for (i in empleo$veinte){
  empleo20 <- append(empleo20, discretizaEmpleo20(i))
}

empleo25 <- c()
for (i in empleo$veinticinco){
  empleo25 <- append(empleo25,discretizaEmpleo25(i))
}

empleo30 <- c()
for (i in empleo$treinta){
  empleo30 <- append(empleo30,discretizaEmpleo30(i))
  
}
empleo35 <- c()
for (i in empleo$treintaicinco){
  empleo35 <- append(empleo35, discretizaEmpleo35(i))
}
empleoTotal <- c()
for (i in empleo$total){
  empleoTotal <- append(empleoTotal, discretizaEmpleoTotal(i))
}
semestres <- empleo$semestres
empleoDiscretizado <- data.frame(semestres, empleo20, empleo25, empleo30, empleo35, empleoTotal)
save(empleoDiscretizado, file="EmpleoDiscretizado.RData")