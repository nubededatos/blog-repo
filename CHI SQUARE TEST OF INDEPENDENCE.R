a <- 3
s <- 1.74
n <- 50
xbar <- 3.2
(1-pnorm(xbar,mean=a,sd=s/sqrt(n)))


z=1.74
pval = pnorm(z, lower.tail=FALSE) 
pval*2

# http://ww2.coastal.edu/kingw/statistics/R-tutorials/independ.html
row1 <- c(81,103,147)
row2 <-c(359,326,277)


row1 <- c(7,1,3)
row2 <-c(87,18,84)
row3 <-c(12,3,4)
row4 <-c(9,1,7)
data.table <- rbind(row1,row2,row3,row4)
chisq.test(data.table)

row1 <- c(6,6)
row2 <-c(16,15)
row3 <-c(4,3)
data.table <- rbind(row1,row2,row3)
chisq.test(data.table)

pchisq(0.0953, 2, lower.tail = FALSE)
