
# Learning RStudio for R Statistical Computing

abalone <- read.csv("https://archive.ics.uci.edu/ml/machine-learning-databases/abalone/abalone.data", header = FALSE) 

names(abalone) <- c("Sex","Length","Diameter","Height","Whole.weight"
                      ,"Shucked.weight","Viscera.weight","Shell.weight"
                      ,"Rings")
write.csv(abalone, "abalone.csv", row.names=FALSE)
table(abalone$Sex)
plot(Length ~ Sex, data=abalone)

meanLength <- mean(abalone$Length)
model <- lm(Whole.weight ~ Length + Sex, data=abalone)
x <- 1:3
cv <- function(x, na.rm=FALSE){
  sd(x, na.rm=na.rm)/mean(x, na.rm=na.rm)
}

# manipulate----
library(manipulate)
manipulate(
  plot( Length ~ Rings, data=abalone
        , axes = axes
        , cex = cex
        , pch = if(pch) 19 else 1
  )
  , axes = checkbox(TRUE, "Show axes")
  , cex = slider(0, 5, initial = 1, step=0.1, label="Point size")
  , pch = button("Fill points")
)


manipulate({
  if (is.null(manipulatorGetState("model"))){
    fit <- lm(Length~Whole.weight, data=abalone)
    manipulatorSetState("model",fit)
    print("hey, I just estimated a model!")
  } else {
    fit <- manipulatorGetState("model")
    print("Now I just retrieved the model from storage")
  }
  plot(abalone$Length, predict(model), col=col)
}
, col=picker("red","green","blue")
)

manipulate({
  plot(Length~Rings, data=abalone)
  xy <- manipulatorMouseClick()
  if (!is.null(xy)) points(xy$userX, xy$userY, pch = 4)
})


dataplot <- function(dat){
  name <- sys.call()[[2]]
  vars <- as.list(names(dat))
  e <- new.env()
  e$data <- name
  manipulate(
{
  form=as.formula(paste(y,x,sep="~"))
  plot(form, data=dat, main=as.character(name), las=1)
  e$form <- form
},
x=do.call(picker, c(vars, initial=vars[1])),
y=do.call(picker, c(vars, initial=vars[2]))
  )
invisible(e)
}
f <- dataplot(abalone)


# Slider
datasetplot <- function(dataset){
  vars <- as.list(names(dataset))
  name <- sys.call()[[2]]
manipulate(
  plot(dataset[, c(xaxis)] ~ dataset[, c(yaxis)], 
       xlab = colnames(dataset)[xaxis],
       ylab = colnames(dataset)[yaxis], 
       main = as.character(name))+
    abline(cua <- lm(dataset[, xaxis] ~ dataset[, yaxis],dataset)), col = "red"),
  xaxis = slider(1,as.numeric(dim(dataset)[2]),initial = 1), #
  yaxis = slider(1,as.numeric(dim(dataset)[2]), initial = 2) # 
  )
}

# Picker
datasetplot2 <- function(dataset){
  vars <- as.list(names(dataset))
  name <- sys.call()[[2]]
  manipulate(
    plot(dataset[, xaxis] ~ dataset[, yaxis], 
         dataset, 
         xlab = xaxis,
         ylab = yaxis, 
         main = as.character(name)),
    xaxis=do.call(picker, c(vars, initial=vars[1])),
    yaxis=do.call(picker, c(vars, initial=vars[2])) # 
  )
}
