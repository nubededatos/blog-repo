# Con Euros 
# Si hemos guardado la columna E sin formato
data <- read.csv("Análisis de ventas.csv", sep=";")

data$Ventas <- gsub("([.])", "", data$Ventas)
data$Ventas <- sub(",",".",data$Ventas)
data$Ventas <- as.numeric(data$Ventas)
# http://www.ats.ucla.edu/stat/r/faq/string_dates.htm
data$Fecha.de.pedido <- as.Date(data$Fecha.de.pedido, "%d/%m/%Y") # Y en mayúsculas o transforma erróneamente.

sapply(data,mode)                      
head(data)

data.m <- melt(data,id.vars = c(1:5), measure.vars = 6)
head(data.m)
sapply(data.m, mode)

# Empezamos a usar reshape2
data.c <- acast(data.m, Empleado ~ variable, sum, margins = "Empleado") # Por empleado
data.c <- acast(data.m, Nombre.del.cliente ~ variable, sum, margins = "Nombre.del.cliente") # Por nombre del cliente
require(plyr) # para usar la función . {plyr}
data.c <- acast(data.m, Nombre.del.cliente ~ variable, sum, margins="Nombre.del.cliente", subset = .(Empleado=="Francisco Chaves")) # Por Nombre del cliente de Francisco Chaves
data.c <- acast(data.m, Nombre.del.cliente,  ~ variable, sum, margins="Nombre.del.cliente", subset = .(Empleado=="Humberto Acevedo" | Empleado=="Francisco Chaves"))
data.c # Por nombre del cliente y de Humberto Acevedo o Francisco Chaves
data.c <- acast(data.m, Fecha.de.pedido  ~ variable, sum, margins=TRUE, subset = .(Fecha.de.pedido =="2006-06-05" & Empleado=="Francisco Chaves"))
data.c 
data.c <- acast(data.m, Fecha.de.pedido ~ variable, sum, margins="Fecha.de.pedido", subset = .(as.Date(Fecha.de.pedido) > "2006-03-01" & Empleado=="Francisco Chaves")) # Ventas de Francisco Chavez desde 2006-03-01
data.c
data.c <- acast(data.m, Nombre.del.cliente + Fecha.de.pedido  ~ variable, sum, margins="Nombre.del.cliente", subset = .(Empleado=="Francisco Chaves"))
data.c 
# Diferentes subtotales
data.c <- acast(data.m, Fecha.de.pedido + Nombre.del.cliente  ~ variable, sum, margins="Nombre.del.cliente", subset = .(Empleado=="Francisco Chaves"))
data.c
# Todos los subtotales
data.c <- acast(data.m, Nombre.del.cliente + Fecha.de.pedido  ~ variable, sum, margins=TRUE, subset = .(Empleado=="Francisco Chaves"))
data.c 
