datos <- read.csv("datos.txt", sep = ";")
hist(datos$año)
names(datos)
colnames(datos) <- c("id", "nombre", "fecha")  # Renombramos las columnas
names(datos)
hist(datos$fecha)
#Formateamos el histograma
intervalos <- seq(from=1913,to=2013,by=10) # Creamos los intervalos
h <- hist(datos$fecha, 
          breaks = intervalos,  # Añadimos los intervalos
          freq = TRUE, # Representa frecuencias
          right = FALSE, # Intervalos [a, b). Por defecto: (a, b]
          col = rgb(79, 129, 189, max = 255), # Color de las columnas
          border = "white",     # Color del borde
          labels = TRUE,        # Etiquetas de las columnas
          main = "Frecuencias", # Título del gráfico
          xaxt = "n",           # Eliminamos eje x
          yaxt = "n",           # Eliminamos eje y
          xlab = "Años",        # Título del eje x
          ylab = NULL,          # Título del eje y
          ylim = c(0, 20))      # Escala de y (fijamos max en 20)
axis(side=1,at=intervalos) # Etiquetas del eje x