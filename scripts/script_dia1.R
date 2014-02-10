# 

setwd("~/Telechargements/essai_StatCourse/stats/scripts")

# eso es mi primer script con R
# help.search("mean")
#?mean



a <- 10
a == 10

# definicion de la variable
largo.de.tortuga <- 45

a <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 9, 0, 7)

b <- 12

c <- a*b

x <- 3.14

y <- x*2 

ls()
list.files()


b <-                                    15



letras <- c("primer", "segundo", "tercero", "quarto")

a <- 4
b <- 3545
c <- 56




c <- 2:7

mat <- matrix(letras, 2, 2)

letras <- c("primer", "segundo", "tercero")




b <- seq(1, 20, 5)
mat <- (b,2,2)



x <- seq(1, 2, length=10)
y <- seq(10, 20, length=10)
z <- rep(3, 15)
x +1
x*2


x <- c(2, 3, 4, 6, 5, 7, -5, 4, 5, 6, 7, 8, 9, 12, 23)
suma.x <- sum(x)
n <- length(x)
media.x <- suma.x/n 

cuadrado <- (x-media.x)^2
suma.cuadrados <- sum(cuadrado)
varianza.x <- suma.cuadrados/(n-1) 


sum((x-sum(x)/length(x))^ 2)/(length(x)-1)











