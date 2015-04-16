#https://stat.ethz.ch/pipermail/r-help/2006-October/115244.html

cafe <- read.delim("~/R/cafe.txt", dec = ",")
barplot(as.matrix(cafe),col=c("white", cua),horiz=TRUE,space= c(0.02,0.02,0.02,0.02,0.02,0.02,0.02,0.02,0.02,0.02),xaxt="n",yaxt="n",border = "gray47")
#http://stackoverflow.com/questions/2288485/how-to-convert-a-data-frame-column-to-numeric-type

#Color
#http://www.stat.tamu.edu/~jkim/Rcolorstyle.pdf
cua <- rgb(0, 112, 192, maxColorValue=255)

axis(2, labels = FALSE, col = "red")

x<-sample(1:10, 5) 
barplot(x, col=c("burlywood1")) 
set.seed(333) 
y<-sample(-3:0, 5, replace=T) 
barplot(x, col=c("burlywood1", "red")[(y==-3)+1],horiz=TRUE,xaxt="n") 

#METODO LARGO
serie1 <- c(0.4, rep(1, 12))
serie2 <- c(0.1, rep(1, 12))
serie3 <- c(0.4, rep(1, 12))
serie4 <- c(0.8, rep(1, 12))
serie5 <- c(1, rep(1, 12))
serie6 <- c(1.4, rep(1, 12))
serie7 <- c(1, rep(1, 12))
serie8 <- c(0.8, rep(1, 12))
serie9 <- c(0.4, rep(1, 12))
serie10 <- c(0.1, rep(1, 12))

cafe <- data.frame(serie1, serie2, serie3, serie4, serie5, serie6, serie7, serie8, serie9, serie10)

#METODO CORTO
# See https://stat.ethz.ch/pipermail/r-help/2011-February/269733.html
fila1 <- rep(c(0.5,1),5)
fila1
restofilas <- rep(1,10)
restofilas
#Using a data frame
z <- t(data.frame(fila1, replicate(12,restofilas)))#transponemos
rownames(z) <- NULL
z
dim(z)
# Using a matrix
matriz <- matrix(c(fila1,replicate(12,restofilas)),ncol=10,byrow=T)
matriz
a <- matrix(1:5)
a
rbind(a,6)

# READ about matrices:
http://stackoverflow.com/questions/3642535/creating-an-r-dataframe-row-by-row
http://rforpublichealth.blogspot.com.es/2013/04/mastering-matrices.html
http://rwiki.sciviews.org/doku.php?id=tips:data-frames:add_row
http://rwiki.sciviews.org/doku.php?id=tips:tips

# Blue (rgb from Excel file) and white
grafico.cafe <- barplot(matriz, col = c("white", rgb(0, 112, 192, maxColorValue = 255)), horiz = TRUE, space = 0.01, xaxt = "n", yaxt = "n", border = "gray")
system.time(grafico.cafe)

# Classic: black and white
barplot(as.matrix(cafe), 
        col = c("white", "black"), 
        horiz = TRUE, space = 0.01, 
        xaxt = "n", 
        yaxt = "n", 
        border = "gray")

# Steelblue and white
barplot(as.matrix(cafe2), col = c("white", "steelblue"), horiz = TRUE, space = 0.01, xaxt = "n", yaxt = "n", border = "gray")



  