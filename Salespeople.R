# Salespeople
# Pivot Tables in R with melt and cast
# DIFERENCIAR ENTRE reshape y reshape2
# http://marcoghislanzoni.com/blog/2013/10/11/pivot-tables-in-r-with-melt-and-cast/
data <- read.csv("Salespeople PivotTable.csv", sep=";")
head(data)
sapply(data, mode)

# If we didn't chage column E format removing $ (SEE OTHER OPTIONS)
data$Order.Amount <- gsub("([/$.])", "", data$Order.Amount) # Delete $ a thousand separator
data$Order.Amount <- sub(",",".",data$Order.Amount) # Substitute decimal separator
data$Order.Amount <- as.numeric(data$Order.Amount)  # Convert character to numeric
sapply(data, mode) # checking results

# If we save CSV without format in column E
data <- read.csv2("Salespeople PivotTable2.csv") # ";" separator as default
head(data)
sapply(data, mode)

# reshape2 Instead of reshape
#http://stackoverflow.com/questions/12377334/reshape-vs-reshape2-in-r
install.packages("reshape2")
require("reshape2")
data.m <- melt(data,id.vars = c(1:4), measure.vars = 5)
head(data.m)
sapply(data.m, mode)
data.c <- acast(data.m, Salesperson ~ variable, sum)
head(data.c)
sapply(data.c, mode)

# Subtotals
# Documentation is not right in reshape2 apparently: "grand\_row" doesn't work
data.c <- acast(data.m, Salesperson ~ variable, sum, margins = "Salesperson")
data.c
data.c <- acast(data.m, Salesperson ~ variable, sum, margins = TRUE ) # All margins
data.c
data.c <- cast(data.m, Salesperson ~ variable, sum, margins=c("grand_row"), subset=(Country=="USA")) # reshape
data.c
data.c <- acast(data.m, Salesperson ~ variable, sum, margins="Salesperson", subset = .(Country=="UK")) # . is actually a function provided by the plyr package.http://stackoverflow.com/questions/15060021/how-do-i-construct-quoted-expressions-for-use-in-reshape2s-dcast
data.c

# By country
data.c <- acast(data.m, Country ~ variable, sum, margins = "Country")
data.c

# --------------------
# --------------------

# Avon example
t <- proc.time() 
gsam <- read.csv2("GSAM_AñoCamp.csv") # ";" separator as default
gsam.m <- melt(gsam,id.vars = c(1:16), measure.vars = c(17:18), na.rm = TRUE) # Al añadir el Id hay una columna más.
gsam.c <- acast(gsam.m, Category ~ variable, sum, margins="Category", subset = .(Market=="SPAIN" & ORDEN>="201415" | Market=="FRANCE" & ORDEN>="201501") )
gsam.c  
proc.time()-t

# Leer http://rprogramming.net/subset-data-in-r/
# Es igual a
# SELECT GSAM_AñoCampR.Category, Sum(GSAM_AñoCampR.[Gross Sales (LC)]) AS [SumaDeGross Sales (LC)], Sum(GSAM_AñoCampR.Units) AS SumaDeUnits
# FROM GSAM_AñoCampR
# WHERE (((GSAM_AñoCampR.Market)="spain") AND ((GSAM_AñoCampR.ORDEN)>=201415)) OR (((GSAM_AñoCampR.Market)="france") AND ((GSAM_AñoCampR.ORDEN)>=201501))
# GROUP BY GSAM_AñoCampR.Category;

# Incluyendo Segment. Recordar es sensible a las minúsculas.
gsam.c <- acast(gsam.m, Category + Segment ~ variable, sum, margins="Category", subset = .(Market=="SPAIN" & ORDEN>="201415" | Market=="FRANCE" & ORDEN>="201501") )


# . is actually a function provided by the plyr package.http://stackoverflow.com/questions/15060021/how-do-i-construct-quoted-expressions-for-use-in-reshape2s-dcast



# Consultas
# Dos variables
gsam.c <- acast(gsam.m, ORDEN + Category + Market~ variable, sum, margins="ORDEN", subset=.(Market=="FRANCE") & subset=.(Market=="SPAIN")) # No consigo que filtre dos países
head(gsam.c)


gsam.p <- ddply(gsam.m, c("ORDEN", "Category"), summarise,sum=sum(value))
gsam.p

head(gsam)
dim(gsam)
head(gsam.m)
gsam.m <- na.omit(gsam.m) # Omitir errores http://www.statmethods.net/input/missingdata.html  SI NO usamos na.rm = TRUE en la anterior línea.
#---------
#http://www.jstatsoft.org/v21/i12/paper
#Smiths case
install.packages("reshape2")
require("reshape2")
smiths <- reshape2::smiths
smiths.m  <-melt(smiths,na.rm = TRUE )
smiths.m  <- melt(smiths)
smiths.c  <-  acast(smiths.m, variable + subject ~ variable)
smiths.c <-  cast(smiths.m, time + subject ~ variable)

# French fries
french_fries <- reshape2::french_fries
ffm <- melt(french_fries, id = 1:4, na.rm = TRUE)
head(ffm)
a <- cast(ffm, subject ~ time, function(x) 30 - length(x))
a
# reshapeGUI()
install.packages("reshapeGUI")
require(reshapeGUI)
reshapeGUI()

#Read http://www.seananderson.ca/2013/10/19/reshape.html 
# http://pvanb.wordpress.com/2012/04/03/reshapegui-a-tool-to-learn-to-use-reshape2/


# http://www.jstatsoft.org/v21/i12/paper
# Reshape
#which presents a new approach that aims to reduce the tedium and complexity of reshaping data.

