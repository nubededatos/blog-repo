# Top 250 Movies at IMDb
# http://www.exegetic.biz/blog/2013/10/top-250-movies-at-imdb/
# Leer los enlaces de la manipulación y tratar de manipular correctamente http://www.imdb.com/chart
install.packages("XML")
install.packages("reshape2")
library("XML")
library("reshape2") # Para usar la función colsplit
url <- "http://www.imdb.com/chart/top"    # Top 250 movies
url <- "http://www.imdb.com/chart/bottom" # Bottom 100 movies
url <- "http://www.imdb.com/chart"

peliculas <- readHTMLTable(url, which = 1, stringsAsFactors = FALSE)

# See data imported
head(peliculas)
edit(peliculas)
fix(peliculas)
dim(peliculas)
names(peliculas)
str(peliculas)

# Manipulating data
#http://stackoverflow.com/questions/7069076/split-column-at-delimiter-in-data-frame
peliculas  <-  transform(peliculas, peliculas = colsplit(peliculas[[2]], pattern = "\n", names = c('rank', 'title', 'year')))

# Delete columns http://stackoverflow.com/questions/6286313/remove-an-entire-column-from-a-data-frame-in-r
peliculas[, c(1,2,4,5,6)] <- list(NULL)
colnames(peliculas) <- c("rating", "title", "year") # Asigno nombres directamente
# https://www.mail-archive.com/r-help@stat.math.ethz.ch/msg92699.html
peliculas$title <- gsub("[[:space:]]", "", peliculas$title) # Eliminaría todos los espacios, no solamente los iniciales y finales
peliculas$title <- gsub("^ +|+ $", "", peliculas$title) 
peliculas$year <- gsub("[[:punct:]]|[[:space:]]", "", peliculas$year) 
peliculas  <-  transform(peliculas,rating = as.numeric(rating))
peliculas  <-  transform(peliculas,year = as.integer(year))

peliculas$rating <- as.numeric(peliculas$rating)
peliculas$year <- as.numeric(peliculas$year)

# Ordenar columnas adecuadamente
peliculas <- peliculas[c(2,3,1)]

head(peliculas)
tail(peliculas)
peliculas[100:110,] # Ejemplo
summary(peliculas)


# CASO 2
url <- "http://www.imdb.com/chart"
peliculas  <-  transform(peliculas, peliculas = colsplit(peliculas[[2]], pattern = "\n", names = c('rank', 'title', 'year')))
peliculas[, c(1,2,6,7)] <- list(NULL)
colnames(peliculas) <- c("weekend", "gross", "weeks", "title", "year")
peliculas$title <- gsub("^ +|+ $", "", peliculas$title) # Probar solo con [[:space:]]
peliculas$year <- gsub("[[:punct:]]|[[:space:]]", "", peliculas$year) 
peliculas$gross <- as.numeric(gsub("\\$|M", "", peliculas$gross))
peliculas$weekend <- as.numeric(gsub("\\$|M", "", peliculas$weekend))
peliculas$weeks  <-  as.integer(peliculas$weeks)
peliculas$year  <-  as.integer(peliculas$year)
peliculas <- peliculas[c(4,5,1,2,3)]

# CASO 3
# Ver http://tonybreyal.wordpress.com/category/r/
url <- "http://www.boxofficemojo.com/alltime/world/"
# De mi manera es mucho más sencillo
peliculas <- readHTMLTable(url, which = 3, stringsAsFactors = FALSE)
peliculas[, c(1)] <- list(NULL)
# Quizá sirvan los nombres de los encabezados y ver limpieza de caracteres
names(peliculas) <- c("Title", "Studio", "Worldwide.Gross", "Domestic.Gross", "Domestic.pct", "Overseas.Gross", "Overseas.pct", "Year")
peliculas$Worldwide.Gross <- as.numeric(gsub("\\$|\\,", "", peliculas$Worldwide.Gross))
peliculas$Domestic.Gross <- as.numeric(gsub("\\$|\\,", "", peliculas$Domestic.Gross))
peliculas$Overseas.Gross <- as.numeric(gsub("\\$|\\,", "", peliculas$Overseas.Gross))
peliculas$Domestic.pct <- as.numeric(gsub("%", "", peliculas$Domestic.pct))
peliculas$Overseas.pct <- as.numeric(gsub("%", "", peliculas$Overseas.pct))

peliculas$Year <- as.integer(gsub("[[:punct:]]|[[:space:]]", "", peliculas$Year) )
str(peliculas)


pattern = "(.*) \\((.*)\\)$" # Parentesis
# http://stackoverflow.com/questions/2261079/how-to-trim-leading-and-trailing-whitespace-in-r
pattern = "^\\s+|\\s+$"  # Espacios

# Mejor que http://stackoverflow.com/questions/5610041/r-how-to-split-a-specific-column-based-on-symbol-in-r
# http://stackoverflow.com/questions/15897236/whats-the-equivalent-to-excels-left-and-right-in-r

# Gráficos simples por defecto
plot(x = peliculas$year,y = peliculas$rating) # create scatterplot
hist(peliculas$year) # Create hsitogram

# Customized histogram
hist(peliculas$year)
intervalos <- seq(1920,2020, 10)
hist(peliculas$year,
     breaks = intervalos,
     right = FALSE,
     col = "steelblue",
     border = "white",
     labels = TRUE,
     main = "nº de películas",
     xaxt = "n",         
     yaxt = "n",
     xlab = "Año",        
     ylab = NULL,
     ylim = c(0, 60))
axis(side = 1, at = intervalos)

# ggpot2
install.packages("ggplot2")
library(ggplot2)

# Scatterplot
ggplot(peliculas, aes(x = year, y = rating))+
      geom_point(color = "red", size = 3)+
      scale_x_continuous( breaks=seq(0,3000, 10))+
      theme_classic()

# Histogram http://docs.ggplot2.org/current/geom_histogram.html
ggplot(peliculas, aes(x = year,y = ..count..))+
  geom_histogram(binwidth = 10, colour = "white", fill = "steelblue")+
  ylab(NULL) + ylim(c(0, 60))+
  scale_x_continuous(breaks = intervalos)+
  stat_bin(binwidth = 10,aes(label=..count..),vjust=-0.5, geom="text")

ggplot_build(tt)$data[[1]]
  
  ggplot(peliculas, aes(x = year))+
  geom_histogram(binwidth = 10, colour = "white", aes(fill = ..count..))+
  ylab(NULL) + ylim(c(0, 60))+
  scale_x_continuous(breaks = intervalos)

# Limpiamos entorno de trabajo
rm(list = ls())
