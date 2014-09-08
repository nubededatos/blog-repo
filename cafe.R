# Importing txt file, previously exported from Excel

cafe <- read.delim("~/R/cafe.txt", dec = ",")
barplot(as.matrix(cafe), col = c("white", rgb(0, 112, 192, maxColorValue = 255)), horiz = TRUE, space = rep(0.02, 5), xaxt = "n", yaxt = "n", border = "gray47") 


cafe2 <- data.frame(serie1, serie2, serie3, serie4, serie5, serie6, serie7, serie8, serie9, serie10)

# Creamos dos vectores
fila.1 <- rep(c(0.5,1),5) # Fila inicial
fila.2a13  <- rep(1,10)   # Resto filas

# 1. Mediante un data.frame
  cafe.df <- t(data.frame(fila.1, replicate(12,fila.2a13))) # Transponemos
  rownames(cafe.df) <- NULL # Eliminamos nombres de las filas
  
# 2. Mediante una matriz
cafe.m <- matrix(c(fila.1,replicate(12,fila.2a13)),ncol=10,byrow=T)

grafico <- barplot(cafe.df, col = c("white", "black" ), horiz = TRUE, space = 0.01, xaxt = "n", yaxt = "n", border = "gray") 

grafico <- barplot(cafe.m, col = c("white", "black" ), horiz = TRUE, space = 0.01, xaxt = "n", yaxt = "n", border = "gray") 

str(cafe.m)
