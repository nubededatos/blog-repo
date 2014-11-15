COFFEE AND PRODUCTIVITY
# http://freakonometrics.hypotheses.org/16010
base=read.table("http://freakonometrics.free.fr/cafe.csv", header=TRUE,sep=";",dec=",")
b=base[!is.na(base$GDP.PPP),]
plot(b[,3],b[,4],xlab="Coffee Consumption", ylab="GDP per hour worked")
text(b[,3],b[,4]+1.6,b[,1],cex=.6)
install.packages("splines")
library(splines)
X=b[,3]
Y=b[,4]
B=data.frame(X,Y)
reg=glm(Y~bs(X),data=B)
y=predict(reg,newdata=data.frame(X=seq(0,10,by=.1)))
lines(seq(0,10,by=.1),y,col="red")

b