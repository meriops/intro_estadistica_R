# R code for figure figmaxlik
# used on line 966 in file main.tex



x <- c(1, 3, 4, 6, 8, 9, 12)
y <- c(5,8,6,10,9,13,12)

tikz(file="figmaxlik.tex")

plot(x,y, pch=19, ylim=c(0,15), bty="l", cex.axis=0.75, cex=1.1)

# ML for intercept
abline(a=0, b=0.68, col="red", lwd=1.5)
abline(a=8, b=0.68, col="red", lwd=1.5)
abline(a=4.827, b=0.68, col="red", lwd=1.5)

# ML for slope
abline(a=4.827, b=1.5, col="red", lwd=1.5)
abline(a=4.827, b=0.2, col="red", lwd=1.5)
abline(a=4.827, b=0.679, col="red", lwd=1.5)

dev.off()


