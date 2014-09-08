# Benford's law

# Freakonometrics: http://freakonometrics.hypotheses.org/5214
benford <- log(1+1/(1:9))/log(10) 
sum(benford)
names(benford) <- 1:9
barplot(benford,col="white",ylim=c(-.045,.3))
abline(h=0)
benford <- log10(1+1/(1:9)) # Base 10

# Mi intento
benford <- log10(1+1/(1:9))
benford <- log(1+1/(1:9), base = 10)
data.frame(benford)
sum(benford)
barplot(benford)
# En una sola línea. Para alternar el orden del eje Y usamos rev()
# https://stat.ethz.ch/pipermail/r-help/2002-July/023244.html
barplot(rev(benford), names.arg = c(9:1), horiz = TRUE, col = "lightblue", border = "white")  
barplot(rev(benford*100),
        main = "Ley de Benford",
        xlab = "%",
        ylab = "Dígitos",
        names.arg = c(9:1),
        horiz = TRUE, 
        col = "steelblue", 
        border = "white", 
        xlim = c(0, 35))                                                                                            
# Para añadir solamente las líneas del eje x
# http://stackoverflow.com/questions/1963492/grid-in-an-r-plot
grid(ny = 0)

# Intento fallido de formatear como porcentajes los ejes
axis(side = 2, at = fff)
round(benford,digits=6)
fff <- paste(round(rev(benford),digits=4)*100, "%", sep="")
fff

# Using ggplot2
http://stackoverflow.com/questions/3695497/ggplot-showing-instead-of-counts-in-charts-of-categorical-variables
require(ggplot2)
ggplot(data=benford, aes(x= factor(benford))) + 
  geom_bar(colour="black", fill="#DD8888", width=.7, stat="identity") + 
  guides(fill=FALSE) +
  xlab("Time of day") + ylab("Total bill") +
  ggtitle("Average bill for 2 people")
