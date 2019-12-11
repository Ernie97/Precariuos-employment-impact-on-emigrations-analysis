load("Contratos.RData")

discretizaContratoIndefinido <- function(x){
  if (x < 33743){
    "Muy bajo"
  }
  else if (x < 48521){
    "Bajo"
  }
  else if (x < 63070){
    "Normal"
  }
  else if (x < 68926){
    "Alto"
  }
  else {
    "Muy Alto"
  }
}

discretizaContratoIndefinidoFomento <- function(x){
  if (x < 4910){
    "Muy bajo"
  }
  else if (x < 8870){
    "Bajo"
  }
  else if (x < 11401){
    "Normal"
  }
  else if (x < 17872){
    "Alto"
  }
  else {
    "Muy Alto"
  }
}

discretizaContratoObra <- function(x){
  if (x < 282822){
    "Muy bajo"
  }
  else if (x < 325570){
    "Bajo"
  }
  else if (x < 587850){
    "Normal"
  }
  else if (x < 605785){
    "Alto"
  }
  else {
    "Muy Alto"
  }
}

discretizaContratoEventual <- function(x){
  if (x < 302201){
    "Muy bajo"
  }
  else if (x < 364714){
    "Bajo"
  }
  else if (x < 617189){
    "Normal"
  }
  else if (x < 635494){
    "Alto"
  }
  else {
    "Muy Alto"
  }
}

discretizaContratoTotal <- function(x){
  if (x < 623184){
    "Muy bajo"
  }
  else if (x < 747936){
    "Bajo"
  }
  else if (x < 1287809){
    "Normal"
  }
  else if (x < 1318748){
    "Alto"
  }
  else {
    "Muy Alto"
  }
}

contratosIndefinido <- c()
for (i in Contratos$indefinido_ordinario){
  contratosIndefinido <- append(contratosIndefinido, discretizaContratoIndefinido(i))
}
contratosIndefinidoFomento <- c()
for (i in Contratos$indefinido_fomento){
  contratosIndefinidoFomento <- append(contratosIndefinidoFomento, discretizaContratoIndefinidoFomento(i))
}
contratosObra <- c()
for (i in Contratos$obra_o_servicio){
  contratosObra <- append(contratosObra, discretizaContratoObra(i))
}
contratosEventual <- c()
for (i in Contratos$eventual_circunstancias){
  contratosEventual <- append(contratosEventual, discretizaContratoEventual(i))
}
contratosTotal <- c()
for (i in Contratos$total){
  contratosTotal <- append(contratosTotal, discretizaContratoTotal(i))
}
semestres <- Contratos$semestres
contratosDiscretizados <- data.frame(semestres, contratosIndefinido, contratosIndefinidoFomento, contratosObra, contratosEventual, contratosTotal)
save(contratosDiscretizados, file="ContratosDiscretizados.RData")