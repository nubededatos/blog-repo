#Datos del Excel Ch 9 Array.xlsx
datos <- read.table("clipboard",header=T)
h <- hist(datos$SS,freq = FALSE)
h # Para mostrar los parámetros del histograma:
curve(dnorm(x,mean=mean(datos$SS),sd=sd(datos$SS)),add=TRUE)
# La parte superior de la distribución normal se corta.
# Cambiamos la escala del eje y
h <- hist(datos$SS,freq = FALSE, main="",xlab="Nº observaciones", ylim=c(0,.02))
curve(dnorm(x,mean=mean(datos$SS),sd=sd(datos$SS)),add=TRUE,)
plot(h,freq = FALSE)

#-----------------------

datos <- read.csv("C:/Users/Ben/Desktop/datos-fechas.txt", sep=";")
colnames(year) <- c("id","nombre","fecha") # Rename columns
h <- hist(datos$year) # Case sensitive to column name
h <- hist(datos$Year)
#Formateamos el histograma: color, borde, density (freq), título y ejes.
# Colours: http://www.stat.columbia.edu/~tzheng/files/Rcolor.pdf
# http://www.r-bloggers.com/color-palettes-in-r/
h <- hist(datos$Year,col = "slategrey", border = 0, freq = FALSE, main = "Frecuencia", xlab= "Años", ylab = "Densidad")
h <- hist(datos$Year,col = "slategrey", border = 0, freq = F, main = "Frecuencia", xlab= "Años", ylab = "Densidad")
curve(dnorm(x, mean=mean(datos$Year),sd=sd(datos$Year)),add=TRUE)

h <- hist(datos$Year,breaks=7,col = "slategrey", border = 0, prob=TRUE, main = "Frecuencia", xlab= "Años", ylab = "Densidad")


