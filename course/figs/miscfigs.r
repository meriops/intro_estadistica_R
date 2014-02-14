
## miscellanous R code to produce figures used in the presentation


# binomial distribution%%{{{
mfig <- function(n){
png(file=paste("LoiBinom_n", n, ".png", sep=""), bg="transparent", pointsize=10, res=300, width=1300, height=1300)
       barplot(dbinom(x = 0:n, size = n, prob = 0.39), names.arg = as.character(0:n), 
        xlab="# de persona con ojos azules", 
        ylab="Probabilidad", cex=1.1, cex.lab=1.1, cex.axis=1.1)
dev.off()
}
%%}}}


# Poisson distribution%%{{{
png(file="LoiPoiss.png", bg="transparent", pointsize=10, res=300, width=1300, height=1300)
barplot(dpois(0:10, 1.775)*80, names=as.character(0:10), ylab="Frecuencia", cex.lab=1.3, cex.axis=1.3)
dev.off()
%%}}}


# Normal distribution. general%%{{{
nd <- seq(-10, 10, 0.05)
y <- list(dnorm(nd, mean=5, sd=1) , dnorm(nd, mean=5, sd=2) , dnorm(nd, mean=5, sd=3) , dnorm(nd, mean=3, sd=3) , dnorm(nd, mean=1, sd=3) , dnorm(nd, mean=0, sd=3) )

for (i in 1:length(y)){
png(file=paste("LoiNorm", i, ".png", sep=""), bg="transparent", pointsize=10, res=300, width=1300, height=1300)
plot(nd, y=y[[i]], type="l", xlim=c(-10, 10), ylim=c(0, 0.4), bty="l", lwd=1.5, ylab="P(X)", cex=1.3, cex.lab=1.3, xlab="X")
dev.off()
}
%%}}}


# standard normal distrib N(0,1)%%{{{
nd <- seq(-3.5, 3.5, 0.05)
y <- dnorm(nd, mean=0, sd=1)

# all no shade
png(file="LoiNorm7.png", bg="transparent", pointsize=10, res=300, width=1300, height=1300)
plot(nd, y=y, type="l", xlim=c(-3.5, 3.5), ylim=c(0, 0.4), bty="l", col="red", lwd=1.5, ann=F)
dev.off()
%%}}}


# 68% between +/1 sigma with shaded area%%{{{
png(file="LoiNorm8.png", bg="transparent", pointsize=10, res=300, width=1300, height=1300)
plot(nd, y=y, type="l", xlim=c(-3.5, 3.5), ylim=c(0, 0.4), bty="l", col="red", lwd=1.5, ann=F)
abline(v=-1, lty=3, lwd=1.2)
abline(v=1, lty=3, lwd=1.2)
gg <- seq(-1,1,0.05)
polygon(x=c(-1, gg,1), y=c(0, c(dnorm(gg, mean=0, sd=1)), 0), density=20, col="black", border=NA)
dev.off()
%%}}}


# 95% bet/ +/- 2 sigma with shaded area%%{{{
png(file="LoiNorm9.png", bg="transparent", pointsize=10, res=300, width=1300, height=1300)
plot(nd, y=y, type="l", xlim=c(-3.5, 3.5), ylim=c(0, 0.4), bty="l", col="red", lwd=1.5, ann=F)
abline(v=-2, lty=3, lwd=1.2)
abline(v=2, lty=3, lwd=1.2)
gg <- seq(-2,2,0.05)
polygon(x=c(-2, gg,2), y=c(0, c(dnorm(gg, mean=0, sd=1)), 0), density=20, col="black", border=NA)
dev.off()
%%}}}


# 99% bet/ +/- 3 sigma with shaded area%%{{{
png(file="LoiNorm10.png", bg="transparent", pointsize=10, res=300, width=1300, height=1300)
plot(nd, y=y, type="l", xlim=c(-3.5, 3.5), ylim=c(0, 0.4), bty="l", col="red", lwd=1.5, ann=F)
abline(v=-3, lty=3, lwd=1.2)
abline(v=3, lty=3, lwd=1.2)
gg <- seq(-3,3,0.05)
polygon(x=c(-3, gg,3), y=c(0, c(dnorm(gg, mean=0, sd=1)), 0), density=20, col="black", border=NA)
dev.off()
%%}}}


# random tree (code from Crawley, adapted)%%{{{

map<-read.table("figs/data_from_Crawley_book/randomtree.txt", header=T)
attach(map)

png(file="randomtree1.png", bg="transparent", pointsize=10, res=300, width=1300, height=1300)
plot(xx,yy,xlab="",ylab="", pch=20) # plot
dev.off()


png(file="randomtree2.png", bg="transparent", pointsize=10, res=300, width=1300, height=1300)
plot(xx,yy,xlab="",ylab="", pch=20) # plot
points(xx[55],yy[55],pch=18, col="red") # point (a)
text(xx[55]+10,yy[55],"(a)", col="red")

points(xx[18],yy[18],pch=18, col="red") # point (b)
text(xx[18]+10,yy[18],"(b)", col="red")
dev.off()

png(file="randomtree3.png", bg="transparent", pointsize=10, res=300, width=1300, height=1300)
plot(xx,yy,xlab="",ylab="", pch=20) # plot
xxa<-c(132,104,93,98,154,141,132) # polyygon (a)
yya<-c(34,42,16,0,0,25,34)
polygon(xxa,yya,col="darkgrey")
points(xx[55],yy[55],pch=16, col="red")
text(xx[55]+10,yy[55],"(a)", col="red")

xxb<-c(238,231,225,224,240,246,238) # polyygon (b)
yyb<-c(256,261,257,245,241,250,256)
polygon(xxb,yyb,col="darkgrey")
text(xx[18]+10,yy[18],"(b)", col="red")
points(xx[18],yy[18],pch=16, col="red")
dev.off()

# Hint: use locator(1) to find the x and yy coordinates of the corners of the shaded areas
%%}}}


#  shade of the tails with position of test statistic %%{{{
nd <- seq(-3.5, 3.5, 0.05)
y <- dnorm(nd, mean=0, sd=1)

png(file="testpos1.png", bg="transparent", pointsize=10, res=300, width=1300, height=1300)
plot(y~nd, type="l", bty="l", xlim=c(-3.5, 3.5), lwd=1.5, ann=F, xaxt="n")
axis(1, at=seq(-3,3,1))
abline(v=-2, lty=3, lwd=1.2)
abline(v=2, lty=3, lwd=1.2)
gg <- seq(-3,3,0.01)
polygon(x=c(-3.5, gg[gg <= {-2}], -2), y=c(0, dnorm(gg[gg<={-2}], mean=0, sd=1), 0), density=30, col="black", border=NA)
polygon(x=c(2, gg[gg >= {2}], 3.5), y=c(0, dnorm(gg[gg>={2}], mean=0, sd=1), 0), density=30, col="black", border=NA)
points(x=1.4, y=-0.015, col="red", pch=17, cex=2.5, xpd=T)
dev.off()


png(file="testpos2.png", bg="transparent", pointsize=10, res=300, width=1300, height=1300)
plot(y~nd, type="l", bty="l", xlim=c(-3.5, 3.5), lwd=1.5, ann=F, xaxt="n")
axis(1, at=seq(-3,3,1))
abline(v=-2, lty=3, lwd=1.2)
abline(v=2, lty=3, lwd=1.2)
gg <- seq(-3,3,0.01)
polygon(x=c(-3.5, gg[gg <= {-2}], -2), y=c(0, dnorm(gg[gg<={-2}], mean=0, sd=1), 0), density=30, col="black", border=NA)
polygon(x=c(2, gg[gg >= {2}], 3.5), y=c(0, dnorm(gg[gg>={2}], mean=0, sd=1), 0), density=30, col="black", border=NA)
points(x=2.4, y=-0.015, col="red", pch=17, cex=2.5, xpd=T)
dev.off()



%%}}}


# 95% bet/ +/- 2 sigma threshold values %%{{{
png(file="PrincipTest1.png", bg="transparent", pointsize=10, res=300, width=1300, height=1300)
plot(nd, y=y, type="l", xlim=c(-3.5, 3.5), ylim=c(0, 0.4), bty="l", col="black", lwd=1.5, ann=F, xaxt="n")
abline(v=-2, lty=3, lwd=1.2)
abline(v=2, lty=3, lwd=1.2)
gg <- seq(-2,2,0.05)
polygon(x=c(-2, gg,2), y=c(0, c(dnorm(gg, mean=0, sd=1)), 0), density=20, col="black", border=NA)
axis(1, at=c(-3, -1, 0, 1, 3), labels=c("-3", "-1", "0", "1", "3") )
mtext(expression("" %up% ""), at=c(-2,2), side=1, col="red", cex=2, line=1)
dev.off()
%%}}}


#  shade of the tails only%%{{{
png(file="PrincipTest2.png", bg="transparent", pointsize=10, res=300, width=1300, height=1300)
plot(nd, y=y, type="l", xlim=c(-3.5, 3.5), ylim=c(0, 0.4), bty="l", col="red", lwd=1.5, ann=F)
abline(v=-2, lty=3, lwd=1.2)
abline(v=2, lty=3, lwd=1.2)
gg <- seq(-3,3,0.01)
polygon(x=c(-3.5, gg[gg <= {-2}], -2), y=c(0, dnorm(gg[gg<={-2}], mean=0, sd=1), 0), density=30, col="black", border=NA)
polygon(x=c(2, gg[gg >= {2}], 3.5), y=c(0, dnorm(gg[gg>={2}], mean=0, sd=1), 0), density=30, col="black", border=NA)
dev.off()
%%}}}


# Lattice plot to show mammal species against productivity separately for each region%%{{{

rm(x,y)
productivity<-read.table("~/Telechargements/essai_StatCourse/figs/data_from_Crawley_book/productivity.txt", header=T)
attach(productivity)
names(productivity)
library(lattice)
library(gplots)

png(file="ScaleDepCorr1.png", bg="transparent", pointsize=10, res=300, width=1300, height=1300)
plot(x,y, ylab="Especies de mamiferos", xlab="Productividad", bty="l", pch=18, cex.lab=1.3)
dev.off()

png(file="ScaleDepCorr2.png", bg="transparent", pointsize=10, res=300, width=1300, height=1300)
plot(x,y, ylab="Especies de mamiferos", xlab="Productividad", bty="l", pch=18, cex.lab=1.3)
smartlegend(x="right", y="bottom", legend=expression(rho == 0.751) , bty="n", cex=1.3, text.col="red")
dev.off()


png(file="ScaleDepCorr3.png", bg="transparent", pointsize=10, res=300, width=1300, height=1300)
xyplot(y~x | f, ylab="Especies de mamiferos",xlab="Productividad",
panel = function(x, y){
panel.xyplot(x, y, pch=18)
panel.abline(lm(y~x))
}
)
dev.off()
%%}}}


# concept of regression%%{{{
reg.data<-read.table("crawley/tannin.txt",header=T)
attach(reg.data)
names(reg.data) <- c("Crecimiento","Tanino")
# graph 1
png(file="conceptregr1.png", bg="transparent", pointsize=10, res=300, width=1300, height=1300)
plot(Crecimiento ~ Tanino, data=reg.data, pch=18, bty="l", cex.lab=1.3, cex=1.3)
dev.off()

# graph2
png(file="conceptregr2.png", bg="transparent", pointsize=10, res=300, width=1300, height=1300)
plot(Crecimiento ~ Tanino, data=reg.data, pch=18, bty="l", cex.lab=1.3, cex=1.3)
abline(coef=c(12, -1.25), col="red", lwd=1.3)
dev.off()
%%}}}


# principle of OLS%%{{{
x <- c(61, 67, 32, 43, 57, 44, 39, 38, 42, 51)
y <- c(30, 33, 15, 23, 26, 18, 23, 17, 27, 37)

xlim <- c(20, 80)
ylim <- c(10, 40)

# graph 1
png(file="principOLS1.png", bg="transparent", pointsize=10, res=300, width=1300, height=1300)
plot(x, y, xlim = xlim, ylim = ylim, pch = 18, cex = 1.5, las = 1, bty="l", cex.lab=1.3)
dev.off()

# graph 2
png(file="principOLS2.png", bg="transparent", pointsize=10, res=300, width=1300, height=1300)
plot(x, y, xlim = xlim, ylim = ylim, pch = 18, cex = 1.5, las = 1, bty="l", cex.lab=1.3)
ytheo <- x/6 + 10
abline(c(10, 1/6), lwd=1.5)
dev.off()

# graph 3
png(file="principOLS3.png", bg="transparent", pointsize=10, res=300, width=1300, height=1300)
plot(x, y, xlim = xlim, ylim = ylim, pch = 18, cex = 1.5, las = 1, bty="l", cex.lab=1.3)
ytheo <- x/6 + 10
abline(c(10, 1/6), lwd=1.5)
points(x, ytheo, pch = 20, col = "slateblue", cex = 1.5)
dev.off()

# graph 4
png(file="principOLS4.png", bg="transparent", pointsize=10, res=300, width=1300, height=1300)
plot(x, y, xlim = xlim, ylim = ylim, pch = 18, cex = 1.5, las = 1, bty="l", cex.lab=1.3)
ytheo <- x/6 + 10
abline(c(10, 1/6), lwd=1.5)
points(x, ytheo, pch = 20, col = "slateblue", cex = 1.5)
segments(x, ytheo, x, y, lwd=1.5, lty="dashed")
dev.off()

# graph 5
png(file="principOLS5.png", bg="transparent", pointsize=10, res=300, width=1300, height=1300)
plot(x, y, xlim = xlim, ylim = ylim, pch = 18, cex = 1.5, las = 1, cex.lab=1.3, bty="l")
ytheo <- x/6 + 17
abline(c(17, 1/6), lwd=1.5)
points(x, ytheo, pch = 20, col = "slateblue", cex = 1.5)
segments(x, ytheo, x, y, lwd=1.5, lty="dashed")
dev.off()

# graph 6
png(file="principOLS6.png", bg="transparent", pointsize=10, res=300, width=1300, height=1300)
plot(x, y, xlim = xlim, ylim = ylim, pch = 18, cex = 1.5, las = 1, cex.lab=1.3, bty="l")
lmd <- lm(y ~ x)
ytheo <- predict(lmd)
abline(lmd$coef, col = "red", lwd = 1.5)
points(x, ytheo, pch = 20, col = "red", cex = 1.5)
segments(x, ytheo, x, y, lwd=1.5, lty="dashed" )
dev.off()
%%}}}


# principle of ANOVA##{{{
oneway<-read.table("crawley/oneway.txt",header=T)
attach(oneway)

png(file="principANOV1.png", bg="transparent", pointsize=10, res=300, width=1300, height=1300)
plot(1:20,ozone,ylim=c(0,8), xlab="Orden", ylab="Ozono (ppcm)", pch=18, cex=1.3, cex.lab=1.3)
dev.off()


png(file="principANOV2.png", bg="transparent", pointsize=10, res=300, width=1300, height=1300)
plot(1:20,ozone,ylim=c(0,8), xlab="Orden", ylab="Ozono (ppcm)", pch=18, cex=1.3, cex.lab=1.3)
abline(mean(ozone),0, col="red", lwd=1.5)
mtext(expression(bar(y)), side=4, las=2, adj=-1, outer=F, cex=1.3, col="red")
dev.off()


png(file="principANOV3.png", bg="transparent", pointsize=10, res=300, width=1300, height=1300)
plot(1:20,ozone,ylim=c(0,8), xlab="Orden", ylab="Ozono (ppcm)", pch=18, cex=1.3, cex.lab=1.3)
abline(h=mean(ozone), col="red", lwd=1.5)
mtext(expression(bar(y)), side=4, las=2, adj=-1, outer=F, cex=1.3, col="red")
for(i in 1:20) lines(c(i,i),c(mean(ozone),ozone[i]), lwd=1.5)
dev.off()


png(file="principANOV4.png", bg="transparent", pointsize=10, res=300, width=1300, height=1300)
plot(1:20,ozone,ylim=c(0,8), xlab="Orden", ylab="Ozono (ppcm)", pch=18, cex=1.3, cex.lab=1.3, type="n")
points(seq(1,19,2),ozone[garden=="A"],pch=1)
points(seq(2,20,2),ozone[garden=="B"],pch=16)
dev.off()


png(file="principANOV5.png", bg="transparent", pointsize=10, res=300, width=1300, height=1300)
plot(1:20,ozone,ylim=c(0,8), xlab="Orden", ylab="Ozono (ppcm)", pch=18, cex=1.3, cex.lab=1.3, type="n")
points(seq(1,19,2),ozone[garden=="A"],pch=1)
#points(seq(2,20,2),ozone[garden=="B"],pch=16)
abline(h=mean(ozone[garden=="A"]), lty=1, lwd=1.5, col="darkgrey")
mtext( expression(bar(y)[A]),side=4,  at=c(21,3), las=2, adj=-0.5,  cex=1.3, col="darkgrey")
dev.off()


png(file="principANOV6.png", bg="transparent", pointsize=10, res=300, width=1300, height=1300)
plot(1:20,ozone,ylim=c(0,8), xlab="Orden", ylab="Ozono (ppcm)", pch=18, cex=1.3, cex.lab=1.3, type="n")
points(seq(1,19,2),ozone[garden=="A"],pch=1)
points(seq(2,20,2),ozone[garden=="B"],pch=16)
abline(h=mean(ozone[garden=="A"]), lty=1, lwd=1.5, col="darkgrey")
mtext( expression(bar(y)[A]),side=4,  at=c(21,3), las=2, adj=-0.5,  cex=1.3, col="darkgrey")
abline(h=mean(ozone[garden=="B"]), lwd=1.5)
mtext( expression(bar(y)[B]),side=4,  at=c(21,5), las=2, adj=-0.5,  cex=1.3)
dev.off()




png(file="principANOV7.png", bg="transparent", pointsize=10, res=300, width=1300, height=1300)
plot(1:20,ozone,ylim=c(0,8), xlab="Orden", ylab="Ozono (ppcm)", pch=18, cex=1.3, cex.lab=1.3, type="n")
points(seq(1,19,2),ozone[garden=="A"],pch=1)
points(seq(2,20,2),ozone[garden=="B"],pch=16)
abline(h=mean(ozone[garden=="A"]), lty=1, lwd=1.5, col="darkgrey")
mtext( expression(bar(y)[A]),side=4,  at=c(21,3), las=2, adj=-0.5,  cex=1.3, col="darkgrey")
abline(h=mean(ozone[garden=="B"]), lwd=1.5)
mtext( expression(bar(y)[B]),side=4,  at=c(21,5), las=2, adj=-0.5,  cex=1.3)
k<- -1
for (i in 1:10){ #
   k<-k+2
   lines(c(k,k),c(mean(ozone[garden=="A"]),ozone[garden=="A"] [i]), lty=1, lwd=1.5, col="darkgrey")
   lines(c(k+1,k+1),c(mean(ozone[garden=="B"]),ozone[garden=="B"] [i]), lwd=1.5) }
dev.off()





png(file="principANOV8.png", bg="transparent", pointsize=10, res=300, width=1300, height=1300)
plot(1:20,ozone,ylim=c(0,8), xlab="Orden", ylab="Ozono (ppcm)", pch=18, cex=1.3, cex.lab=1.3, type="n")
points(seq(1,19,2),ozone[garden=="A"],pch=1)
points(seq(2,20,2),ozone[garden=="B"],pch=16)
abline(h=mean(ozone), col="lightpink", lwd=1.5, lty=2)
mtext(expression(bar(y)), side=4, las=2, adj=-1, outer=F, cex=1.3, col="lightpink", lty=2)
for(i in 1:20) lines(c(i,i),c(mean(ozone),ozone[i]), lwd=1.5, col="lightpink", lty=2)
points(seq(1,19,2),ozone[garden=="A"],pch=1)
points(seq(2,20,2),ozone[garden=="B"],pch=16)
abline(h=mean(ozone[garden=="A"]), lty=1, lwd=1.5, col="darkgrey")
mtext( expression(bar(y)[A]),side=4,  at=c(21,3), las=2, adj=-0.5,  cex=1.3, col="darkgrey" )
abline(h=mean(ozone[garden=="B"]), lwd=1.5)
mtext( expression(bar(y)[B]),side=4,  at=c(21,5), las=2, adj=-0.5,  cex=1.3)
k<- -1
for (i in 1:10){ #
k<-k+2
lines(c(k,k),c(mean(ozone[garden=="A"]),ozone[garden=="A"] [i]), lty=1, lwd=1.5, col="darkgrey")
lines(c(k+1,k+1),c(mean(ozone[garden=="B"]),ozone[garden=="B"] [i]), lwd=1.5) 
}
dev.off()



png(file="principANOV9.png", bg="transparent", pointsize=10, res=300, width=1300, height=1300)
plot(1:20,ozone,ylim=c(0,8), xlab="Orden", ylab="Ozono (ppcm)", pch=18, cex=1.3, cex.lab=1.3, type="n")
points(seq(1,19,2),ozone[garden=="A"],pch=1)
abline(h=mean(ozone[garden=="A"]), lty=1, lwd=1.5, col="darkgrey")
mtext( expression(bar(y)[A]),side=4,  at=c(21,3), las=2, adj=-0.5,  cex=1.3, col="darkgrey" )
k<- -1
for (i in 1:10){ #
k<-k+2
lines(c(k,k),c(mean(ozone[garden=="A"]),ozone[garden=="A"] [i]), lty=1, lwd=1.5, col="darkgrey")
}
dev.off()
##}}}




# day 1 variance


# Demonstrating the range of data to measure variability##{{{
y<-c(13,7,5,12,9,15,6,11,9,7,12)

pdf(file="var1.pdf", bg="transparent", pointsize=12, width=5, height=5 ) 
plot(y,ylim=c(0,20), pch=18, cex=1.5)
dev.off()

pdf(file="var2.pdf", bg="transparent", pointsize=12, width=5, height=5 ) 
plot(y,ylim=c(0,20), pch=18, cex=1.5)
lines(c(4.5,6),c(15,15),lty=2, lwd=1.2)
lines(c(3,4.5),c(5,5),lty=2, lwd=1.2)
lines(c(4.5,4.5),c(5,15), lwd=1.2)
#text(5,16,"Rango = 5 to 15")
dev.off()


pdf(file="var3.pdf", bg="transparent", pointsize=12, width=5, height=5 ) 
plot(y,ylim=c(0,20), pch=18, cex=1.5)
abline(h=mean(y), lwd=1.2)
mtext( expression(bar(y)),side=4,  at=mean(y), las=2, adj=-0.5,  cex=1.5)
for (i in 1: length(y)){
lines(c(i,i),c(mean(y),y[i]), lwd=1.2)}
dev.off()
##}}}


# variance and sample size##{{{
pdf(file="var6.pdf", bg="transparent", pointsize=12)
plot(c(0,32),c(0,15),type="n", xlab="n", ylab="Varianza", cex=1.3, cex.lab=1.5)
for (df in seq(3,31,2)) {
for( i in 1:30){
x<-rnorm(df,mean=10,sd=2)
points(df,var(x)) }}
dev.off()
##}}}


# heteroscedasticity##{{{
#par(mfcol=c(1,2))
pdf(file="heterosced1.pdf", bg="transparent", pointsize=12)
a <- rnorm(90, 5, 10)
plot(a, pch=18, xlab="Valores ajustados", ylab="Residuales", cex=1.5, cex.lab=1.5)
dev.off()


pdf(file="heterosced2.pdf", bg="transparent", pointsize=12)
b <- rnorm(30, 5, 10)
c <- rnorm(30, 5, 20)
d <- rnorm(30, 5, 40)
e <- c(b,c,d)
plot(e, pch=18, xlab="Valores ajustados", ylab="Residuales", cex=1.5, cex.lab=1.5)
dev.off()
##}}}


# non-normality##{{{
decay<-read.table("crawley/decay.txt",header=T)
attach(decay)
names(decay)
plot(x,y)
abline(lm(y~x))
result<-lm(y~x)

pdf(file="nonorm1.pdf", bg="transparent", pointsize=12)
qqnorm(result$residuals, cex=1.5, cex.lab=1.3, ann=F, pch=18,  lwd=30)
qqline(result$residuals, cex=1.5, cex.lab=1.3, ann=F, pch=18, lwd=3, lty=6, col="darkgrey") 

#plot(result, 2, cex=1.3, cex.lab=1.3, ann=F, sub.caption=NA, pch=18, caption=NA, lwd=30)
title(xlab="Cuantilos teoricos", ylab="Residuales estandarizados", cex.lab=1.5, main="Q-Q plot")
dev.off()
##}}}


# polynomial regression##{{{
rm(x,y)
#par(mfrow=c(1,1))
curve<-read.table("crawley/decay.txt",header=T)
attach(curve)
names(curve)

pdf(file="polynom1.pdf", bg="transparent", pointsize=12)
plot(x,y,pch=18, cex=1.7, ann=F, cex.axis=1.3)
title(xlab="Tiempo", ylab="Emisiones radioactivas", cex.lab=1.7)
dev.off()

pdf(file="polynom2.pdf", bg="transparent", pointsize=12)
plot(x,y,pch=18, cex=1.7, ann=F, cex.axis=1.3)
title(xlab="Tiempo", ylab="Emisiones radioactivas", cex.lab=1.7)
abline(lm(y~x), lwd=4, col="red", lty=2)
dev.off()

x2<-x^2
quadratic<-lm(y~x+x2)
linear<-lm(y~x)

xv<-seq(0,30,0.1)
yv<-predict(quadratic,list(x=xv,x2=xv^2))

pdf(file="polynom3.pdf", bg="transparent", pointsize=12)
plot(x,y,pch=18, cex=1.7, ann=F, cex.axis=1.3)
lines(xv,yv, lwd=4, col="red", lty=2)
title(xlab="Tiempo", ylab="Emisiones radioactivas", cex.lab=1.7)
dev.off()

exponential<-lm(log(y)~x)
yv2<-exp(predict(exponential,list(x=xv)))

pdf(file="polynom4.pdf", bg="transparent", pointsize=12 ) #, width=5, height=5)
plot(x,y,pch=18, cex=1.7, ann=F, cex.axis=1.3)
lines(xv,yv2, lwd=4, col="red", lty=2)
title(xlab="Tiempo", ylab="Emisiones radioactivas", cex.lab=1.7)
dev.off()
##}}}


#  non linear regression##{{{
deer<-read.table("crawley/jaws.txt",header=T)
attach(deer)
names(deer)

pdf(file="regnolin1.pdf", bg="transparent", pointsize=12 ) #, width=5, height=5)
plot(age,bone,pch=18, ann=F, cex=1.5, cex.axis=1.5)
title(xlab="Edad", ylab="Longitud del hueso", cex.lab=1.7)
dev.off()

model2<-nls(bone~a*(1-exp(-c*age)),start=list(a=120,c=0.064))

av<-seq(0,50,0.1)
bv<-predict(model2,list(age=av))

pdf(file="regnolin2.pdf", bg="transparent", pointsize=12 ) #, width=5, height=5)
plot(age,bone,pch=18, ann=F, cex=1.5, cex.axis=1.7)
lines(av,bv, col="red", lwd=4, lty=2)
title(xlab="Edad", ylab="Longitud del hueso", cex.lab=1.7)
dev.off()
##}}}






