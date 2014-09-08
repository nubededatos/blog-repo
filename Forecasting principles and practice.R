# https://www.otexts.org/fpp/2/1
plot(melsyd[,"Economy.Class"], 
     main="Economy class passengers: Melbourne-Sydney",
     xlab="Year",ylab="Thousands")

fuel2 <- fuel[fuel$Litres<2,]
summary(fuel2[,"Carbon"])
sd(fuel2[,"Carbon"])

beer2 <- window(ausbeer, start=1992, end=2006-.1)
lag.plot(beer2, lags=9, do.lines=FALSE)
beerfit1 <- meanf(beer2, h=11)
beerfit2 <- naive(beer2, h=11)
beerfit3 <- snaive(beer2, h=11)
meanf(y, h)

#http://robjhyndman.com/hyndsight/dailydata/

# Mi ejemplo.
rfactor <- read.csv2("rfactor.csv",header=T)
rfactor1 <- rfactor[rfactor$CONCEPTO == "0 1.BRANCH CURR-CAMP", c(1, 12, 13, 16),] # Subset 
y <- ts(rfactor1$SALES_TODAY, frequency=5)
fit <- ets(y)
fc <- forecast(fit)
plot(fc)


y <- msts(rfactor1$SALES_TODAY, seasonal.periods=c(7,365.25))
fit <- tbats(y)
fc <- forecast(fit)
plot(fc)
y1 <- meanf(y, h=12)
y2 <- naive(y, h=12)
y3 <- snaive(y, h=12)
y1
y2
y3

plot(y1, plot.conf=FALSE, 
     main="Forecasts for Avon Spain")
lines(y2$mean,col=2)
lines(y3$mean,col=3)
legend("topright",lty=1,col=c(4,2,3),
       legend=c("Mean method","Naive method","Seasonal naive method"))

y <- ts(rfactor1$SALES_TODAY, frequency=7)
z <- fourier(ts(rfactor1$SALES_TODAY, frequency=365.25), K=5)
zf <- fourierf(ts(rfactor1$SALES_TODAY, frequency=365.25), K=5, h=100)
fit <- auto.arima(y, xreg=cbind(z,holiday))
fc <- forecast(fit, xreg=cbind(zf,holidayf), h=100)

z <- zoo(rfactor1, order.by=rfactor1$ID)


prueba1 <- naive(y, h=2)
aaa <- ts(rfactor1,frequency=12)
interpolated <- na.approx(z)
head(rfactor1)
head(rfactor)
names(rfactor)
edit(rfactor)
summary(rfactor$SALES_TODAY)
plot(rfactor1$SALES_TODAY,xlab="dates")
ts(rfactor$SALES_TODAY, frequency=30)
window()
plot(melsyd)
head(melsyd)