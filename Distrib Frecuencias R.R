datos <- read.csv("datos.txt", sep = ";")
hist(datos$a?o)
names(datos)
colnames(datos) <- c("id", "nombre", "fecha")  # Renombramos las columnas
names(datos)
hist(datos$fecha)
#Formateamos el histograma
intervalos <- seq(from=1913,to=2013,by=10) # Creamos los intervalos
h <- hist(datos$fecha, 
          breaks = intervalos,  # A?adimos los intervalos
          freq = TRUE, # Representa frecuencias
          right = FALSE, # Intervalos [a, b). Por defecto: (a, b]
          col = rgb(79, 129, 189, max = 255), # Color de las columnas
          border = "white",     # Color del borde
          labels = TRUE,        # Etiquetas de las columnas
          main = "Frecuencias", # T?tulo del gr?fico
          xaxt = "n",           # Eliminamos eje x
          yaxt = "n",           # Eliminamos eje y
          xlab = "A?os",        # T?tulo del eje x
          ylab = NULL,          # T?tulo del eje y
          ylim = c(0, 20))      # Escala de y (fijamos max en 20)
axis(side=1,at=intervalos) # Etiquetas del eje x

Modificado