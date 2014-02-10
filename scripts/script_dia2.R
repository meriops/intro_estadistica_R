
# aqui empieza el script del segundo dia
# fecha: miercoles 28 de abril 2010
# siguiendo obstinadamente hacia llegar a dominar el R


# ------------------------------------------------------
# NUMERO DE ERRORES PER PAGINA EN UN FOLLETO DE 8 PAGINAS
# ------------------------------------------------------

setwd(C:\Documents and Settings\sysadmin\Desktop\curso R\stats\scripts)

# Crear el vector err1 = 2 3 0 3 1 0 0 1
err1=c(2, 3, 0, 3, 1, 0, 0, 1)

# Calcular la media, varianza y median de err1
m=sum(err1)/length(err1)
v=sum(err1-m)^2/length(err1)-1
me=median(err1)

# Entre el primer borrador y el segundo borrador, se corregio todas las errores de la primera pagina
# SIN tipear el vector completo, crear el vector err2 = 0 3 0 3 1 0 0 1 que toma al dia el conteo de errores  (hacer una copia err2 de err1 y cambiar el primer valor de err2 usando los indices)
err2 =c((0), 3, 0, 3, 1, 0, 0, 1)
err2=c((false),3,0,3,1,0,0,1)
err2=err1
err2[1]=0
err2=replace((err1,1,0),(err1,2,4))
err2[c(1,3,5)]=45
idx=c(1,3,5)creo un vector idx con las posiciones que quiero reemplazar
val=c(76,68,9)un vector val con los valores que quiero reemplazar
err2[c(1,3,5)]=c(76,68,9)
err2=replace(err2, c(1,3,5,), c(76,68,9))

# visualizar el segundo valor de err2
err2[2]


# visualizar todos los valores de err2 EXCEPTO el cuarto valor

err2[-4]

# visualizar el primer, tercer y quinto valor de err2

err2[1,3,5]
# Que es el maximo numero de errores que hay en una pagina?
m=max(err2)




# Cuales paginas tienen tantos errores? (usar un test con == )) aqui pregunta por el maximo error
$ 0 3 0 3 1 0 0 1
which(err2==m) m es el maximo de err2 m=max(err2)  m es el valor mas grande de error
n=length(err2)
hay aginas con 3 errores
cuales son estas paginas?
err2==3  o err2==m para saber si es mayor, se usa > en la misma ecuacion, para saber si es distinto se usa != en la misma ecuacion

quiero los indices de los valores TRUE: indices=1:8

logico=err2==m



# Cuales paginas tienen tantos errores? (?which)



# Cuales paginas tienen tantos errores? (sin usar which)
                 # cuantas paginas en total? n=length(err2)
                 # vector paginas de los numeros de paginas? paginas=1:8
                 # visualizar el ultimo vector
                 # usar el vector paginas y un test con == para obtener los numeros de las paginas donde hay muchos errores
vector.logico=err2==m    paginas[vector.logico]

# En la segunda version del borrador, cuantos errores hay en total?


# En la segunda version del borrador, cuantas paginas tienen 1 o mas errores?


# cuantos errores fueron corregidos entre el primer borrador y el segundo?


crear un vector vec que sea una seria de 50 valores empezando en 7 y con intervalos de 3
vec=seq(from=7, length.out=50, by=3)

reemplazar vec por vec*-1
vec=-vec

cuales son los indices de estos valores "en los treintas"?
poner el resultado en el vector indices
primertest=vec>=30
segundotest=vec<40
para hacer los dos test en un paso:
testotal= (vec>=30 & vec<40)

otrovec a b c d e f 
quiero sacar: a c e
otrovec[c(1,3,5)]

queremos usar los indices de los elementos de vec que cumplen con el test

n=length(vec)
indices=1:n
ind cumple con el test:indices[testotal]

queremos usar los indices para extraer los valores de vec que cumplen con el test
valores=vec[testotal]  esto se llama extraccion con vector logico
probamos lo mismo con which:  ind.cumple.con.test=which=(vec>=30&vec<40)
valores=vec[ind.cumple.con.test]

crear una matriz de 10 filas y 5 columnas:
mat=matrix(vec,10,5)

sacar los valores mayores de 145:
indic=which(mat>145)

cumplecontest=mat[indic]

quiero los valores menores de 145
nocumplecontest=mat[-indic]






para importar datos:

read.table("C:/Documents and Settings/sysadmin/Desktop/stats/data/beaksize.csv",sep="\t",dec=",", header=T)
sep: separador  dec:que simbolo define al decmal    header:si las columnas estan nombradas en la primer fila
str():da informacion aerca de como esta estructurada la tabla, el data frame
head(): muestra una pequeña parte inicial de los datos

para reemplazar los nombre de ingles a español:
colnames(picos)=c("tamaño","sobreviv")
par:define los parametros dentro de los graficos, se pueden elegir los colores, letra, etc, dentro del grafico
