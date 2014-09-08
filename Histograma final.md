Title
========================================================

This is an R Markdown document. Markdown is a simple formatting syntax for authoring web pages (click the **Help** toolbar button for more details on using R Markdown).

When you click the **Knit HTML** button a web page will be generated that includes both content as well as the output of any embedded R code chunks within the document. You can embed an R code chunk like this:


```r
datos <- read.csv("datos.txt", sep = ";")  # Fichero en el directorio
hist(datos$año)  # Intentamos crear histograma
```

```
## Error: 'x' must be numeric
```

```r
names(datos)  # Genera error por la ñ en Año
```

```
## [1] "Id"     "Nombre" "Año"
```

```r
colnames(datos) <- c("id", "nombre", "fecha")  # Renombramos las columnas
names(datos)
```

```
## [1] "id"     "nombre" "fecha"
```

```r
# Creamos histograma por defecto
hist(datos$fecha)  # Usamos el nuevo nombre: fechas
```

![plot of chunk unnamed-chunk-1](figure/unnamed-chunk-1.png) 




```r
# Tabla de frecuencias
# http://www.r-bloggers.com/r-function-of-the-day-cut-2/
# http://www.r-tutor.com/elementary-statistics/quantitative-data/relative-frequency-distribution-quantitative-data
intervalos <- seq(from = 1913, to = 2013, by = 10) 
frecuencias <- cut(datos$fecha, 
                 breaks = intervalos,   
                 dig.lab = 4,   # Nº de dígitos de los intervalos
                 right = FALSE) # Intervalos [a, b). Por defecto: (a, b]
tabla.frec  <- table(frecuencias)   # Crea la tabla de frecuncias
as.data.frame(tabla.frec)
```

```
##    frecuencias Freq
## 1  [1913,1923)   16
## 2  [1923,1933)    8
## 3  [1933,1943)   18
## 4  [1943,1953)    3
## 5  [1953,1963)    7
## 6  [1963,1973)   11
## 7  [1973,1983)    6
## 8  [1983,1993)    9
## 9  [1993,2003)   14
## 10 [2003,2013)    8
```




```r
#Formateamos el histograma
intervalos <- seq(from = 1913, to = 2013, by = 10) 
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
axis(side = 1, at = intervalos)  # Etiquetas del eje x 
```

![plot of chunk unnamed-chunk-3](figure/unnamed-chunk-3.png) 


  

