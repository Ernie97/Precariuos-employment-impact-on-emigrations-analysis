load("Emigraciones.RData")
discretizaemigraciones20 <- function(x){
  if (x < 17603){
    "Muy bajo"
  }
  else if (x < 18069){
    "Bajo"
  }
  else if (x < 19113){
    "Normal"
  }
  else if (x < 19626){
    "Alto"
  }
  else {
    "Muy Alto"
  }
}

discretizaemigraciones25 <- function(x){
  if (x < 30606){
    "Muy bajo"
  }
  else if (x < 32146){
    "Bajo"
  }
  else if (x < 32580){
    "Normal"
  }
  else if (x < 33108){
    "Alto"
  }
  else {
    "Muy Alto"
  }
}

discretizaemigraciones30 <- function(x){
  if (x < 29380){
    "Muy bajo"
  }
  else if (x < 32891){
    "Bajo"
  }
  else if (x < 34530){
    "Normal"
  }
  else if (x < 35490){
    "Alto"
  }
  else {
    "Muy Alto"
  }
}

discretizaemigraciones35 <- function(x){
  if (x < 21709){
    "Muy bajo"
  }
  else if (x < 21710){
    "Bajo"
  }
  else if (x < 24143){
    "Normal"
  }
  else if (x < 25906){
    "Alto"
  }
  else {
    "Muy Alto"
  }
}

discretizaemigracionesTotal <- function(x){
  if (x < 100886){
    "Muy bajo"
  }
  else if (x < 109283){
    "Bajo"
  }
  else if (x < 111318){
    "Normal"
  }
  else if (x < 113713){
    "Alto"
  }
  else {
    "Muy Alto"
  }
}

emigraciones20 <- c()
for (i in emigraciones$veinteA24){
  emigraciones20 <- append(emigraciones20, discretizaemigraciones20(i))
}

emigraciones25 <- c()
for (i in emigraciones$veinticincoA29){
  emigraciones25 <- append(emigraciones25,discretizaemigraciones25(i))
}

emigraciones30 <- c()
for (i in emigraciones$treintaA34){
  emigraciones30 <- append(emigraciones30,discretizaemigraciones30(i))
}
emigraciones35 <- c()
for (i in emigraciones$treintaycincoA39){
  emigraciones35 <- append(emigraciones35, discretizaemigraciones35(i))
}
emigracionesTotal <- c()
for (i in emigraciones$totalEdades){
  emigracionesTotal <- append(emigracionesTotal, discretizaemigracionesTotal(i))
}
semestres <- emigraciones$semestres
emigracionesDiscretizado <- data.frame(semestres, emigraciones20, emigraciones25, emigraciones30, emigraciones35, emigracionesTotal)
save(emigracionesDiscretizado, file="emigracionesDiscretizado.RData")