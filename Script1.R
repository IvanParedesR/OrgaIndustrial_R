#Propuesta de Clases

#### 1. Conociendo los paquetes y el uso general

rm(list = ls()) #Limpiando el ambiente

#En caso de que no se cuenten con estos paquetes se necesita instalarlos quitar el "#" y correr la instrucción
#install.packages("pacman")
#install.packages("foreign")
#install.packages("doBy")
#install.packages("reshape")
#install.packages("data.table")
#install.packages("stats")
#install.packages("ggplot2")

#Y ahora vamos a cargar los paquetes

library(pacman)
library(foreign)
library(reshape)
library(data.table)
library(stats)
library(ggplot2)

#### 2. Funciones y operaciones 

# + suma             < menos que           ! x  NO logico
# - resta            > mas que             x & y Y logico
# * multiplicacion   <= menor o igual      x && y id.
# / division         >= mayor o igual      x | y logical OR
# ^ potencia         == igual              x || y id.
#!= diferente        xor(x, y) exclusivamente x o y

1 / 200 * 30 #se pueden poner comentarios adjunto a la orden.
(59 + 73 + 2) / 3 #suma
3+rnorm(1) #se puede llamar el valor de una variable aleatoria que se distribuye normalmente y con media 1 
4-3 == 1 #operacion logica
sin(pi*pi / 2)
sqrt(16)
log(29)
2^4
2^4 < 1 #operacion logica
log(5) #log(x) log base e de x
exp(1.609438) #exp(x) antilog de x (ex)
log(5,3) #log(x,n) log base n de x
log10(5) #log10(x) log  base 10 de x
sqrt(16) #sqrt(x) raiz cuadra de x
factorial(5) #factorial(x) x! = x × (x ??? 1) × (x ??? 2)×· · ·×3 × 2
ceiling(56.6) #redondeo de numeros
trunc(5.6) #trunc(x) trUncar x entre x y 0, e.g. trunc(1.5) = 1, trunc(-1.5) = -1;
round(54.652561257832, digits = 5) #round(x, digits=0) 
signif(54.652561257832, digits=6) #signif(x, digits=6) 
runif(10) #runif(n) genera una distribución uniforme con media 0 y dsv 1.
abs(-5) 
?abs

## funciones trigonometricas

cos(3.5) #cos(x) 
sin(3.4) #sin(x) 
tan(4.5) #tan(x) 
acos(0.4) #acos(x), 
asin(0.4)
atan(5) #atan(x)
acosh(5)
asinh(5) 
atanh(0.99) #para valores de 0 - 1


### 3. Vectores y matrices

vector <- c(4,5,6,7,2,1,2,6,7)

log(vector) #muchas de las funciones y operaciones son analogas con vectores

vector^2

#Creamos matrices A, B, C, D, E e I. 

A = matrix(c(2, 4, 3, 1, 5, 7), nrow=2, ncol=3) #creación de matrices
A

t(A) #transpone la matriz

B = matrix(c(2, 4, 0, 1, 5, 1), nr=2, nc=3) 
B

C = matrix(c(2, 4, 3, 1, 5, 7), nrow=3, ncol=2)
C

cbind(t(C), A) #unimos C transpuesta con A columnas
rbind(t(C), A) #unimos C transpuesta con A filas

B %*% C #multipliación de matrices

#matriz cuadrada

D= matrix(c(2, 4, 3, 1, 5, 7, 0, 4, 5), nrow=3, ncol=3) #creación de matrices
D

#determinante
det(D)

#inversa
DI <- solve(D)
DI
#matriz de ceros
E <- matrix(0,3,3)
E
#matriz diagonal
I <- diag(c(1,1,1))
I

#### 4. Marcos de datos

#Se instala el paquete readxl
#install.packages("readxl")
#install.packages("tibble")
#install.packages("foreign")

#se llama al paquete readxl, no obstante existen otros muchos paquetes para leer datos en especifico, spss, stata
#cvs u otros. Ahora trabajaremos con el de excel, aunque la estructura es similar en los demás
library(readxl)
library(tibble)
library(foreign)


#### 5. Graficas

# la grafica mas sencilla con puntos negros. En ella se grÃ¡fica X vs Y.
ggplot(data = mtcars) +   
  geom_point(mapping = aes(x = mpg, y = hp)) +
  scale_x_continuous(name = "Variable de MPG") + #agregamos titulo y nombres de variables con estas 3 lineas
  scale_y_continuous(name = "Caballos de fuerza") +
  ggtitle("Grafica de la base de carros")
?ggplot
ggplot(data = mtcars) +   
  geom_point(mapping = aes(x = mpg, y = hp, color = carb, size=qsec)) +
  scale_color_continuous(name='Carburador') + #notese como se pone los nombres de los ejes, las etiquetas y
  #las variables
  scale_size_continuous(name='Torción por segundo') +
  scale_x_continuous(name = "Variable de MPG") + 
  scale_y_continuous(name = "Caballos de fuerza") +
  ggtitle("Grafica de carros") +
  theme_bw() #pone en blanco el fondo

## le pone color al contorno de cada uno de los tipos de corte.
ggplot(data = mtcars) + 
  geom_bar(mapping = aes(x = carb ))+
  scale_x_continuous(name = "Variable de MPG") + 
  scale_y_continuous(name = "Total") +
  ggtitle("Grafica de carros 2") 

library(ggthemes)

Eco <- ggplot(data = mtcars) +   
  geom_point(mapping = aes(x = mpg, y = hp, size=qsec)) +
  scale_size_continuous(name='Torción por segundo') +
  scale_x_continuous(name = "Variable de MPG") + 
  scale_y_continuous(name = "Caballos de fuerza") +
  ggtitle("Grafica de carros")

Eco + theme_stata() + scale_color_stata() +
  ggtitle("Para los stateros del Poli")

Eco + theme_excel(base_size = 12, base_family = "", horizontal = TRUE)+
  ggtitle("Para los excelinos del Poli")

##### 6. Mapas

#install.packages("mapdata")
#install.packages(c("ggplot2", "devtools", "dplyr", "stringr"))
#install.packages(c("maps", "mapdata"))
#install.packages(c("ggmap"))

library(mapdata)
library(ggplot2)
library(ggmap)
library(maps)

if (!require("devtools")) {
  install.packages("devtools")
}
devtools::install_github("diegovalle/mxmaps")

#install.packages("units") 
#install.packages("mxmaps")

library("mxmaps")

df_mxstate$value <- df_mxstate$pop
View(df_mxstate)

mxstate_choropleth(df_mxstate,
                   title = "   Poblacion por estado") 


##mapas de los estados
View(df_mxmunicipio)
df_mxmunicipio$politecnico <- 1
df_mxmunicipio$politecnico[600:699]=0
df_mxmunicipio$politecnico[250:279]=0
df_mxmunicipio$politecnico[705]=0
df_mxmunicipio$politecnico[707]=0

df_mxmunicipio$value <- df_mxmunicipio$politecnico

mxmunicipio_choropleth(df_mxmunicipio, 
                   num_colors = 1, #se puede poner solamente 1
                   zoom = c(09002:09017, 15001:15125),
                   title = "Municipios",
                   legend = "Ubicación")


library(xlsx)
write.xlsx(df_mxmunicipio, "D:/Users/iparedes/Documents/Clase 2 Comie/mydata.xlsx")

### 7. Gráficas en 3D

library(plotly)

plot_ly(x=mtcars$mpg, y=mtcars$cyl, z=mtcars$hp, type="scatter3d", mode="markers")

------------------------------------------------------------------------------------
