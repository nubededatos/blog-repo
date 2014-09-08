datos <- read.csv("datos.txt", sep=";") # Fichero en el wd (directorio de trabajo)
hist(datos$año) # Genera error por la ñ
head(datos)
colnames(datos) <- c("id","nombre","fecha") # Renombramos las columnas
h <- hist(datos$fecha,col="slategrey",border="white",freq=T,main="Frecuencia",xlab="Años",ylab="Densidad", breaks=7) # Cambiamos colores, borde y título eje x.
h  # Información sobre el histograma

#El número de intervalos (number of bins) es solo una sugerencia si no especificamos el vector. Ver ?hist, arguments: breaks: In the last three cases the number is a suggestion only;
curve(dnorm(x, mean=mean(datos$fecha),sd=sd(datos$fecha)),add=TRUE)

d <- density(datos$fecha)
plot(d, main="Fecha")
polygon(d, col="slategrey", border="white")

#http://statistics.ats.ucla.edu/stat/r/gbe/histogram.htm
set.seed(121343)
u <- rnorm(100)
hist(u)
#with shading
hist(u, density=20)

#http://stackoverflow.com/questions/16931895/excat-number-of-bins-in-histogram-in-r
data <- c(5.28, 14.64, 37.25, 78.9, 44.92, 8.96, 19.22, 34.81, 33.89, 24.28, 6.5, 4.32, 2.77, 17.6, 33.26, 52.78, 5.98, 22.48, 20.11, 65.74, 35.73, 56.95, 30.61, 29.82)
hist(data, breaks=seq(0,80,l=6), freq=FALSE,col="orange",main="Histogram", xlab="x",ylab="f(x)",yaxs="i",xaxs="i")


hist(datos$fecha, breaks=c(1912, 1922, 1932, 1942, 1952, 1962, 1972, 1982, 1992, 2002, 2012), freq=TRUE,col="slategrey",border="white",labels=TRUE,main="Histograma", xlab="Años",ylab="Frecuencia")

# O generando intervalos antes
intervalos <- seq(from=1912,to=2012,by=10)
hist(datos$fecha, breaks=intervalos, freq=TRUE,col=rgb(79,129,189,max=255),border="white",labels=TRUE,main="Histograma", xaxt="n", yaxt="n", xlab="Años",ylab="Frecuencia",ylim=c(0,20))   
axis(side=1,at=intervalos)

table(intervalos)
names(datos)
