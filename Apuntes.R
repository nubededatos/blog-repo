# R 1.1 - Initial Setup and Navigation
# Strategies that will make beginning R users more efficient: writing code using a "script" and navigating through directories within R.
3+4
5*5
2+1
getwd()
setwd("file path")

# R 1.2 - Calculations and Variables
# Get acquainted with performing basic computations in R, creating R objects (sometimes called "variables"), and seeing and running earlier commands that were run in the console.
3+4
5*5
2+1
sqrt(16)
factorial(4)
4 * 3 * 2 * 1

x <- 4
x * x
sqrt(x)

my.height <- 5*12+8
my.height

# R 1.3 - Create and Work With Vectors
# Learn how to create a vector in R using the c() function and the colon-notation (e.g. 1:5), find the length of a vector using the length() function, and subset vectors with bracket-notation and the head() and tail() functions.

my.height <- 5*12+8
my.height
v <- c(2, 3, 5, 7, 11, 13)
v[3]
look.at <- 1:3
v[look.at]

length(v)
head(v)
tail(v, 3)
v

# R 1.4 - Character and Boolean Vectors
# So far we've seen objects that use numbers, but R is also built to handle more types of objects. Here we explore vectors that contain strings or Boolean values (TRUE / FALSE).


v <- c("Gangnum Style", "Charlie bit my finger", "Evolution of dance", "Rickroll", "Lady Gaga")
length(v)
TRUE
FALSE
# Boolean variables in capital letters
# C(trur, false, false) is not valid
c(TRUE, FALSE, FALSE)
under.10 <- nchar(v) < 10
v[under.10]


# R 1.5. Vector Arithmetic. Google Developers.
# This video demystifies the different ways R performs vector arithmetic (e.g. addition and multiplication), covering topics including element-wise arithmetic, vector recycling, and how some functions are automatically applied across the elements in a vector. The seq() function is also introduced.

# Vectores y matrices
v <- c(10, 20, 30, 40, 50, 60)
v
v + 1
2*v

w <-  2:7
w
v*w

# Recycle vector w
w <-  c(5, 10)
w
v*w
# Recycle vector w with a warning
w <-  seq(5, 20, 5)
w
v*w

1:10          # Números (integer)
letters[1:10] # Letras minúsculas
LETTERS[1:10] # Letras mayúsculas 
seq(1, 10, 2) # Función sequence
seq(letters[1], letters[10], 2)

# R 1.6.Buildind and subsettin Matrices
# Learn how to create a matrix with dimensions of your choosing, how recycle a vector when creating a matrix, and how to query specific characteristics of the vector using functions such as dim(), head(), and tail(). Details and potential pitfalls for subsetting a matrix using the bracket-notation are also covered.

m <- matrix(1:100, nrow = 10, ncol = 10, byrow = TRUE)
dim(m)   # Dimensions, nº de filas y columnas
length(m)
head(m, 1)
tail(m, 1)
nchar(m) # Nº de caracteres
m[5, 5] # Fila 5, columna 5
m[, 5] # Columna 5, todas las filas
m[5, ] # Fila 5, todas las columnas
m[1:2, 8:10] # FIlas 1 a las 2, columnas de la 8 a la 10


# R 1.7 - Section 1 Review and Help Files
# A quick review of the topics covered in the Section 1 videos: vectors, matrices, subsetting, and a few standard functions. Also learn how to access help files in R.

c(2, 3, 5, 7, 1:5)
25:30
v <- 25:60
head(v)
tail(v)

letters
lettes[5:10]

m <- matrix(1:15, 3, 5)
m[1:2, 3:5]

?function name

# R 2.1 - Loading Data and Working With Data Frames
# Get a refresher on navigating directories on your computer in R, and learn to load a CSV (comma-separated values) data set in the form of a "data frame" using the read.csv() function, which is a special type of data matrix. This video also introduces factor variables and explores the data in a data frame using the dim(), head(), length(), names(), and subset() functions.
# Matrices sólo pueden guardar un tipo de variable para toda la matriz. Data frames pueden guardar diferentes variables para cada columna.
getwd()
list.files()
setwd("rutacompletadelacarpeta")
setwd("NombreCarpetaDentroWD") #Asignar un nuevo wd desde la consola si ya existe la carpeta en el wd
dir.create("Proyecto") #Crea carpeta llamada proyecto en el wd.
file.exists("fichero.csv") #Comprueba si el fichero existe. Necesario incluir la extensión.
names(dataframe) # Accedemos a los nombres del dataframe. antes de usar el $ para extraer informaci?n por columna
subset() # Buscar ejemplos interesantes
as.character() #convertir factors (mezcla de variable numérica y de carácter)into 

# R 2.2 - Loading Data, Object Summaries, and Dates
# Learn how to load data in the form of a tab-delimited text file using the read.delim(), how to get a high-level overview of an R object using the str() and summary() functions, and get a crash-course into working with dates in R with an example highlighting why this skill is so useful.
# Mismas funciones que para matrices u otros objetos
# Ver mis otros apuntes en el .txt, Importar datos en R
stocks <- read.delim("stocks.txt")
length(stocks)
head(stocks, 3)
tail(stocks, 3)
str(stocks) # Estructura del objeto
summary(stocks)
  # Interesante ejemplo para formatear una variable factor como fecha
str(stocks$date) # Es un factor
# Lo transformamoes en fecha
stocks$date <- as.Date(stocks$date, "%d-%b-%y")
head(stocks$date)
?strptime
GOOG <- subset(stocks, ticker == "GOOG")
plot(GOOG$date, GOOG$close, type="l")

# R 2.3 - if() Statements, Logical Operators, and the which() Function
# if-else statements are a key component to any programming language. This video introduces how to effectively use these statements in R and also clarifies some nuances of logical operators in R. Two related functions are also introduced: ifelse() as a shortcut that can be used to create faster and more readable code, and the which() function that retrieves the positions in a Boolean vector that are TRUE.

stocks <- read.delim("stocks.txt")
stocks <- na.omit(stocks) # Omitir valores no disponibles en los datos
summary(stocks)

if (stocks$close[1] > stocks$open[1]) {
  status  <- "up"
} else if (stocks$close[1] < stocks$open[1]) {
  status  <- "down"
} else {
  status  <- "flat"
}
status

cond <- stocks$close > stocks$open
status <- ifelse(cond, "up", "flat") # Si se cumple la condición anterior "up" mayor que, si no flat (menores o iguales)
cond <- stocks$close < stocks$open
status <- ifelse(cond, "down", status) # Si se cumple la condición anterior, menor que "down", si no deja los status anteriores (mayor que "up"e igual "flat")
# Explicación. Primero etiqueta correctamente todo lo que es mayor que el cierre como "up". Y etiqueta el resto como "flat". Segundo etiqueta correctamente todo lo que es menor que el cierrre como "down", es decir corrige los "flat" que no lo eran realmente. Quedan los "flat" correctos por eliminación.
head(status)
table(status) # Tabla con los resultados

# Logical operators
set.seed(1977) # Si quieramos que los resultados 
x <- sample(-1:13, 10)
y <- sample(-1:13, 10)
all(x > 0)
x == y
any( x == y)
x > 0 & y > 0
x > 0 | y > 0
x
y

?xor # Logical operators, Consultar
# which function
fluctuation <- (stocks$high - stocks$low)/stocks$open
head(fluctuation)
big.change <- abs(fluctuation) > 0.25
head(big.change)
which(big.change)

# R 2.4 - for() Loops and Handling Missing Observations
# This video discusses for() loops, which are a structure that can be used to execute a set of code repeatedly. Also covered in this video are the min(), max(), and append() functions, as well as how to identify and omit missing values.
x <- c()
for (i in 1:10) {
  x <- append(x, i^i)
}
x

the.tickers <- unique(stocks$ticker)
# Ejecutamos desde esta línea hasta fin:
lows <- c()
highs <- c()
for (ticker in the.tickers){
  look.at <- stocks$ticker == ticker
  lows <- append(lows, min(stocks$low[look.at], na.rm = TRUE))
  highs <- append(highs, max(stocks$high[look.at], na.rm = TRUE))
}
the.tickers
lows
highs
# fin
sum(is.na(stocks$low)) # missing data

# R 2.5 - Lists
# Learn how to create and use lists in R, which are dynamic, flexible R objects that can hold and organize other R objects.

x <- list(1:5, "okay", TRUE)
x[[2]]
list.files()
stocks <- read.delim("stocks.txt")
the.tickers <- unique(stocks$ticker)
stock.summary <- list()
for (ticker in the.tickers){
  these <- stocks$ticker == ticker
  stock.summary[[ticker]] <- summary(stocks[these,])
}
stock.summary$GOOG

# R 3.1 - Managing the Workspace and Variable Casting
# View all the objects in the workspace using ls(), remove objects using rm(), cast a variable as a different type using an as.[type]() function, and use lists or data frames to organize data or results.
# Variable factor
x <- 1:10
as.numeric(x)
as.character(x)
x <- as.factor(x)
# Converting factor to numeric:
x <- as.numeric(as.character(x))

# Lists

results <- list()
results$gp1 <- c(40, 20, 16)
results$gp2 <- c(25, 15, 9) 
results$gp3 <- c(32, 35, 12)
results$gp4 <- c(28, 19, 15)
results

ur <- unlist(results)
ur
mr <- matrix(ur, 4, 3, byrow = TRUE)
mr
dr <- as.data.frame(mr)
colnames(dr) <- c("n", "mean", "sd")
dr
  
# R 3.2 - The apply() Family of Functions
# When data are organized in a matrix or data frame, the apply() function can be used to calculate summaries (or apply a more complex function) across either the rows or columns of the data object. Or if summaries for each group (level) of one or more variables are desired, use the tapply() or by() function.
# Apply
rev <- read.csv("revenue.csv", header = FALSE)
head(rev, 3)
apply(rev, 2, sum)
apply(rev, 1, sum)
colSums(rev)
rowSums(rev)

# Tapply
mk <- read.delim("mariokart.txt")
head(mk, 4)
summary(mk)
tapply(mk$totalPr, mk$cond, sum) # Groups specified in the second argument
tapply(mk$totalPr, mk$cond, mean)
tapply(mk$totalPr, mk$wheels, mean)
tapply(mk$totalPr, mk[ , c("cond", "wheels")], mean)
tapply(mk$totalPr, mk[ , c("cond", "wheels")], length) # to see number of observartions and check if the mean is reliable

# R 3.3 - Access or Create Columns in Data Frames, or Simplify a Data Frame using aggregate()
# The with() function makes it easy to access many variables (columns) in a data frame for one-off calculations, the within() function can be used to create new columns that are merged with the original data frame, and aggregate() is useful for aggregating variables in a data frame across groupings based on one or more variables.

mariokart <- read.delim("mariokart.txt")
head(mariokart, 4)
# with to access columns in a data frame
closePr <- with(mariokart, totalPr - shipPr)
head(closePr, 20)

# within to create new columns and merge them in a new data frame
mk <- within(mariokart, { 
  closePr <- totalPr - shipPr
})
head(mk)

# aggregate to summarize results
mk <- mariokart
aggregate(. ~ wheels + cond, mk, mean)
# . means keep all the variable for the output
# left of ~ variables to aggregate across
# data frame
# last argument, how to aggregate the variables

aggregate( totalPr ~ wheels + cond, mk, mean)
# Previous line produces very similar results to:
tapply(mk$totalPr, mk[ , c("cond", "wheels")], mean)

# R 4.1 - Basic Structure of a Function
# This video introduces the basic structure of a function, covering the declaration of the function, using an argument, and returning a result.
set.seed(100)
d <- rpois(25, 8)
d

GetMeanAndSE <- function(x){
  m <- mean(x)
  n <- length(x)
  SE <- sd(x)/sqrt(n)
  return(c(m, SE))
}
GetMeanAndSE(d)

# R 4.2 - Returning a List and Providing Default Arguments
# Become more proficient in writing functions by learning the standard way to return more complex results from functions using a list, and learn how to specify a default value for an argument.
set.seed(100)
d <- rpois(25, 8)
d

# version 1
GetCI <- function(x){
  m <- mean(x)
  n <- length(x)
  SE <- sd(x)/sqrt(n)
  ci <- m + c(-1, 1)*qt(0.975, n-1)*SE
  return(list(mean = m, se = SE, ci = ci))
}
GetCI(d)

# version 2: level
GetCI <- function(x, level = 0.95){ # Confidence level
  m <- mean(x)
  n <- length(x)
  SE <- sd(x)/sqrt(n)
  upper <- 1- (1-level)/2
  ci <- m + c(-1, 1)*qt(upper, n-1)*SE
  return(list(mean = m, se = SE, ci = ci))
}
GetCI(d) # Default 0.95 
GetCI(d, 0.99) # Default 0.99
GetCI(d, 99) # Generates a warning message

# R 4.3 - Add a Warning or Stop the Function Execution
# The most helpful functions return clear warnings and errors when something is wrong. This video introduces the warning() and stop() functions, which can be used within a function to report a warning to the user or stop the function's execution.
set.seed(100)
d <- rpois(25, 8)

GetCI <- function(x, level = 0.95){ # Confidence level
  if (level <= 0 | level >= 1){
    stop("The 'level argument must be >0 and <1")
  }
  if(level < 0.5){
    warning("Confidence levels are often close to 1, e.g. 0.95")
  }
  m <- mean(x)
  n <- length(x)
  SE <- sd(x)/sqrt(n)
  upper <- 1- (1-level)/2
  ci <- m + c(-1, 1)*qt(upper, n-1)*SE
  return(list(mean = m, se = SE, ci = ci))
}
GetCI(d, 99) # Generates a warning message

# R 4.4 - Passing Additional Arguments Using an Ellipsis

# Sometimes it is useful to be able to pass any extra arguments to another function. For example, if a new plotting function is created that makes use of the function called plot(), it would be useful to be able to be able to specify additional details to plot() automatically. This is possible using an ellipsis, "...".

revenue <- read.csv("revenue.csv", header = FALSE)
head(revenue, 3)

# version 1
RevSummary <- function(x) {
  if (!is.matrix(x) && !is.data.frame(x)){
    stop("'x', must be a matrix or data frame")
  }
  rev.per.company <- colMeans(x)
  rev.per.day <- rowMeans(x)
  return(list(rev.per.company = rev.per.company, rev.per.day = rev.per.day))
}
RevSummary(revenue)
# It returns NA values
which(is.na(revenue), arr.ind = TRUE)

# version 2. To remove NA values from the calculation
RevSummary <- function(x, ...) {
  if (!is.matrix(x) && !is.data.frame(x)){
    stop("'x', must be a matrix or data frame")
  }
  rev.per.company <- colMeans(x, ...)
  rev.per.day <- rowMeans(x, ...)
  return(list(rev.per.company = rev.per.company, rev.per.day = rev.per.day))
}
RevSummary(revenue, na.rm = TRUE)

# R 4.5 - Make a Returned Result Invisible and Build Recursive Functions
# Use the invisible() function in place of return() in a function to prevent the output from printing to the user's screen but still allow the result to be stored into an R object. Additionally, when building a recursive function, use the Recall() function.

annoying <- function(x) {
  invisible(rep(x, 1000))
}
tmp <- annoying(1:3)
tmp

# Recursive function
LogMe <- function(x){
  return(ifelse(x >1, Recall(log(x)), x))
}
LogMe(3.392)
LogMe(exp(3.392))

# R 4.6 - Custom Functions With apply()
# In the last section of videos, the apply() function was introduced. A prebuilt function is often used in this function, but it is also common to write a new function within apply() or to apply a custom function.
set.seed(100)
x <- matrix(rpois(1e4, 8), 1e3)
apply(x, 2, mean)
# Version 1. No braces
apply(x, 2, function(x) sd(x)/sqrt(length(x)))
# Version 2. Braces
apply(x, 2, function(x) {sd(x)/
      sqrt(length(x))})

tmp <- apply(x, 2, GetCI)
tmp
is.list(tmp)
tmp[[1]]

# Data sets to practice your R skills
ChickWeight - experimental comparing chicken feeds
InsectSprays - experimental comparing insect sprays
rock - rock samples from petroleum reservoir
mtcars - vehicle characteristics for 32 cars
morley - speed of light measurements from 1879
iris - measurements of 150 flowers of different types
ToothGrowth - data concerning Vitamin C and teeth
CO2 - CO2 uptake from plants under different conditions

To learn more about a data set, examine its help file
?ChickWeight
