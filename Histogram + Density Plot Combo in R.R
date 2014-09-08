
# http://blog.mollietaylor.com/2012/09/histogram-density-plot-combo-in-r.html
png("beaverhist.png")
layout(matrix(c(1:2), 2, 1, 
              byrow = TRUE))
hist(beaver1$temp, # histogram
     col = "peachpuff", # column color
     border = "black", 
     prob = TRUE, # show densities instead of frequencies
     xlim = c(36,38.5),
     xlab = "temp",
     main = "Beaver #1")
lines(density(beaver1$temp), # density plot
      lwd = 2, # thickness of line
      col = "chocolate3")
hist(beaver2$temp, # histogram
     col = "peachpuff", # column color
     border = "black", 
     prob = TRUE, # show densities instead of frequencies
     xlim = c(36,38.5),
     xlab = "temp",
     main = "Beaver #2")
lines(density(beaver2$temp), # density plot
      lwd = 2, # thickness of line
      col = "chocolate3")


hist(beaver1$temp, # histogram
     col="peachpuff", # column color
     border="black",
     prob = TRUE, # show densities instead of frequencies
     xlab = "temp",
     main = "Beaver #1")
lines(density(beaver1$temp), # density plot
      lwd = 2, # thickness of line
      col = "chocolate3")
