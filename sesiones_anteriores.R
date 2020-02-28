##Ejemplo libreria####


library(lattice)
demo(lattice)

##limpiar memoria####
rm(list = ls())

########################################################

# Crear indices en los comentarios ## comentario ####
##Sesion 1.1 Basica

########################################################

##Crear un objeto: flecha de asignacion####

2-1
a<-1
str(a)#
length(a)
??str
??vv
vv <- c(1:10000)# generar vector de las 1 a 10000 de 1 en 1
str(vv)
head(vv,5000000)

cc <- "hola"
str(cc)
ccc <- c("hola mundo", "adios mundo",66)# la c es para concatenar
class(ccc)
View(ccc)

?cat
View(cat(cc,ccc))
View(ccc)

write.csv(ccc,"tabla_prueba.csv")
getwd()

# seleccionar de un vector
nuevo <- vv[500]

##2 - Leer y salvar los datos

##Para seleccionar entre corchetes --variable[filas,columnas]--



#Hacemos un vector con una secuencia

??sequence

new5 <- seq(15,-2, lenght = 100)
View(new5)


#Generacion de matrices
??rep
vector4 <- rep(c(1:4), times = 250) # de 1 a 4, 250 veces
vector4 <- rep(c(1:4), each = 250, times = 1) # de 1 a 4, 250 veces

??matrix

matriz1 <- matrix(vector4, nrow = 250, ncol = 4)

#Seleccionamos de la 3ª columna las filas de 50 a 111

seleccion1 <- matriz1[c(50:111),3]
View(seleccion1)

#seleccionamos todas las filas con valores menores o iguales a 2

matriz2 <- matriz1[matriz1 <= 2]
View(matriz2)

#### data.frames 

area.urb <- rnorm (1000, mean = 20, sd = 2)
prob.inc <- rnorm (1000, mean = 0.6, sd = 0.1)
tipo <-  rep(c("med","temp","bor","trop"), times = 250)

data <- data.frame(area.urb,prob.inc,tipo)
View(data)

# mostrar la probabilidad de incendi en las areas urbana de mas de 17

kk <- data [data$area.urb > 17,]
head(kk)
mean(kk)
sd(kk)

# mostrar areas urbanas de mas 15 o mediterraneas

dataOR <- data [data$area.urb > 15 | data$tipo == "med",]

# mostrar areas urbanas de mas 15 y mediterraneas

dataAND <- data [data$area.urb > 15 & data$tipo == "med",2]

View(dataAND)
View(dataOR)

#### archivos CSV
getwd()
write.csv(data, "area_fuego.csv")

data.f <- read.csv("area_fuego.csv", sep = ",")
str(data.f)

#### analisis: calcular estadisticas basicas

# area quemada y tipo de incendio calculando la media, sd, bocplot y hist

mean(data.f$area.urb)
mean(data.f[,1])
mean(data.f[,2])

#### primer grafico en R

tiff("boxplot_inc.tif", width = 210, height = 130, units = "mm", res = 400)
par(mfrow=c(2,2), bg = "grey", bty = "n")    #### te divide el panel y concatena lo que hay debajo
boxplot(data.f$area.urb, col = "green")
hist(data.f$area.urb, col = "green", main = "", xlab = "Area urbana")
boxplot(data.f$prob.inc, col = "green")
hist(data.f$prob.inc, col = "green", main = "", xlab = "Probabilidad de incendios")
dev.off()

# area quemada y tipo de incendio calculando por bioma

tapply(data.f$area.urb, data.f$tipo,mean)

boxplot(tapply(data.f$area.urb, data.f$tipo,mean))

# ddply resume diferentes funciones para diferentes factores

install.packages("plyr")
library("plyr")
version


# Repite el precio el numero de veces del segundo parentesis

# define los vectores precio e id por separado

precio <- rep(c(4,2,1,3),c(1,5,10,14))

id <- (paste("id",c(1:30), sep = " - "))

# crea el data frame con los vectores antes creados

data <- data.frame(id,precio)

data$libros <- rep(c("novelas","tebeos","cuentos"),10)

data$precio > 2.5 & data$libros == "novelas"

item <- data[1,] # seleccionar la primera fila de un data frame


summary(data$precio)
if (item$precio > 2.5 | data$libros == "novelas"){print("se cumple la condicion")} # te devuelve el resultado de la condicion

paga <- 3

## Con la paga da para comprar??

for(i in 1:nrow(data)){
  if (data$precio[i] < paga){print("puedes comprar el libro")
    print(as.character(data$id[i]))}
}

## bucles con for y else

names(data)
for(i in 1:nrow(data)){
  if (data$precio[i] < paga)
  {print(paste("puedes comprar el libro", data$id[i], "y es una", data$libros[i]))}
  else {print(paste("no puedes comprar el libro", data$id[i], "y es una", data$libros[i]))}
}


## rellenar una nueva columna

names(data)
for(i in 1:nrow(data)){
  if (data$precio[i] < paga)
  {data$decision[i] <- (paste("puedes comprar el libro", data$id[i], "y es una", data$libros[i]))}
  else {data$decision[i] <- (paste("no puedes comprar el libro", data$id[i], "y es una", data$libros[i]))}
}
View(data$decision)

# crear vector con 100 numeros dist normal, media 2 y sd 0.1
vec1 <- rnorm(100, mean = 2, sd = 0.1)

# crear matriz con 20 filas y 10 columnas

m1 <- matrix(nrow = 20,ncol = 10)

# muestra aleatoria de 20 elementos

sample(vec1, 20)

# rellenar matriz con las muestras aleatorias

for(i in 1:ncol(m1)){
  m1[,i] <- sample(vec1, 20)
}

View(m1)

# hacer 10 graficos tipo histograma uno por columna


x11() # abre los graficos en una ventana nueva
par(mfrow = c(2,5))
for(i in 1:ncol(m1)){
  hist(m1[,i])
}

#intentar guardar los histogramas en 10 archivos de imagen diferentes


### funcion sumar 2 numeros


suma2numeros <- function(a,b){a+b}

a <- 1
b <- 145 

suma2numeros (a,b)

# para seleccionar registros dentro de vectores con muchos registros

largo <- c("a","b","c","d","e","f","g","h","i")
corto <- c("a","b","c")

largo %in% corto

