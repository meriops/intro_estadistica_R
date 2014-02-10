
setwd("~/Telechargements/essai_StatCourse/figs")

library(tikzDevice)




# normal distribution
means <- numeric(10000)
for (i in 1:10000){
means[i] <- mean(runif(5)*10)
}

xv <- seq(0,10,0.1)
yv <-dnorm(xv, mean=4.998581, sd=1.28996)*5000

tikz(file="Normaldistrib.pgf", width=2.3, height=2.3)
  hist(means, ylim=c(0,1600), main="Normal", xlab="", ylab="", axes=F, cex.main=0.9 )
lines(xv, yv)
dev.off()




# Poisson distribution

tikz(file="Poissondistrib.pgf", width=2.3, height=2.3)



dev.off()

