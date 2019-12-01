###Canacar
https://www.cofece.mx/cofece/phocadownload/PlaneacionE/cofece_evaluacion_mercado_de_autotransporte_de_carga.pdf

#Evaluación del impacto de una práctica colusiva en el mercado de autotransporte de carga en México
Andrés Aradillas López

#Resumen
#Durante un periodo que abarcó de septiembre de 2008 a junio de 2010, la Cámara Nacional de Autotransporte de Carga (CANACAR) y sus miembros se coludieron para
#transferir los aumentos en el precio del combustible directamente a sus clientes a través del llamado Cargo por Ajuste de Combustible (CPAC). El presente documento estudia el
#impacto de dicha práctica anticompetitiva en la evolución de precios y calcula el impacto resultante en el bienestar. La metodología gira en torno a la comparación estadística
#entre el comportamiento observado en los precios y el contrafactual que hubiera sido esperado en la ausencia de la práctica anticompetitiva. Los resultados son consistentes
#con un impacto medible y estadísticamente significativo de la conducta anticompetitiva en los precios observados durante el periodo de estudio.


#install.packages("ggfortify")

library(tidyverse)
library(readxl)

#extraemos la base desde el archivo que les mande.
#aqui deben instalar su 

BaseCanacar <- read_excel("D:/Users/iparedes/Documents/Clase/BaseCanacar.xlsx",
                          sheet = "Datos", skip = 1)
View(BaseCanacar)


#install.packages("Hmisc")
library("Hmisc", lib.loc="~/R/R-3.5.1/library")
library(ggfortify)

ts(BaseCanacar$Y, frequency = 12, start = c(2004, 1))
ts(BaseCanacar$LUB, frequency = 12, start = c(2004, 1))
ts(BaseCanacar$LLAN, frequency = 12, start = c(2004, 1))
ts(BaseCanacar$REFAC, frequency = 12, start = c(2004, 1))
ts(BaseCanacar$DIES, frequency = 12, start = c(2004, 1))
ts(BaseCanacar$COLUS, frequency = 12, start = c(2004, 1))
ts(BaseCanacar$CICLO1, frequency = 12, start = c(2004, 1))
ts(BaseCanacar$CICLO2, frequency = 12, start = c(2004, 1))
ts(BaseCanacar$CICLO3, frequency = 12, start = c(2004, 1))
ts(BaseCanacar$CICLO4, frequency = 12, start = c(2004, 1))
ts(BaseCanacar$T, frequency = 12, start = c(2004, 1))

View(BaseCanacar)

ggplot(data=BaseCanacar, aes(x=T, y=Y, group = 1)) +
  geom_line(color = ifelse(BaseCanacar$COLUS == 1, "red", "blue"))+
  ggtitle("Sin tiempos para encabezados")+
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

BaseCanacar

#Obtenemos las diferencias

#diferencia de Y
BaseCanacar$diferenciaY <- Lag(BaseCanacar$Y, +1)
BaseCanacar$DY = BaseCanacar$Y-BaseCanacar$diferenciaY


#diferencia de Lubricante
BaseCanacar$diferenciaLUB <- Lag(BaseCanacar$LUB, +1)
BaseCanacar$DLUB = BaseCanacar$LUB-BaseCanacar$diferenciaLUB

#diferencia de LLantas
BaseCanacar$diferenciaLLAN <- Lag(BaseCanacar$LLAN, +1)
BaseCanacar$DLLAN = BaseCanacar$LLAN-BaseCanacar$diferenciaLLAN


#diferencia de Refacciones
BaseCanacar$diferenciaREFAC <- Lag(BaseCanacar$REFAC, +1)
BaseCanacar$DREFAC = BaseCanacar$REFAC-BaseCanacar$diferenciaREFAC


#diferencia de Diesel
BaseCanacar$diferenciaDIES <- Lag(BaseCanacar$DIES, +1)
BaseCanacar$DDIES = BaseCanacar$DIES-BaseCanacar$diferenciaDIES

ts(BaseCanacar$DY, frequency = 12, start = c(2004, 1))

# Gráfica con la diferencia
ggplot(data=BaseCanacar, aes(x=T, y=DY, group = 1)) +
  geom_line(color = ifelse(BaseCanacar$COLUS == 1, "red", "blue"))

Reg1 = lm(BaseCanacar$DY ~ BaseCanacar$DLUB + BaseCanacar$DLLAN + BaseCanacar$DREFAC + BaseCanacar$DDIES + BaseCanacar$Q1 + BaseCanacar$Q2 + BaseCanacar$Q3 + BaseCanacar$Q4 + 0) 
summary(Reg1)
rrs1_ = sum(resid(Reg1)^2)

Datacc <- filter(BaseCanacar, COLUS == 1) 
View(Datacc)

Regcc = lm(Datacc$DY ~ Datacc$DLUB + Datacc$DLLAN + Datacc$DREFAC + Datacc$DDIES + Datacc$Q1 + Datacc$Q2 + Datacc$Q3 + Datacc$Q4) 
summary(Regcc)
rrs3_ =sum(resid(Regcc)^2)

Datasc <- filter(BaseCanacar, COLUS == 0) 
View(Datasc)

Regsc = lm(Datasc$DY ~ Datasc$DLUB + Datasc$DLLAN + Datasc$DREFAC + Datasc$DDIES + Datasc$Q1 + Datasc$Q2 + Datasc$Q3 + Datasc$Q4) 
summary(Regsc)
rrs2_ = sum(resid(Regsc)^2)

Numerador_1 = (rrs1_-(rrs2_+rrs3_))/8
Numerador_1
Denominador_1 = ((rrs2_+rrs3_))/(113)
Denominador_1

Chow = Numerador_1/Denominador_1
Chow

#Valor F critico
qf(.95, df1=8, df2=113)

#p-value
pf(q=Chow, df1=8, df2=113, lower.tail=FALSE)

BaseCanacar$DY_s <- 0.398029 - 0.009522*BaseCanacar$DLUB +
  0.023981*BaseCanacar$DLLAN - 0.053209*BaseCanacar$DREFAC - 0.031074*BaseCanacar$DDIES -
  0.067652*BaseCanacar$Q1 - 0.072426*BaseCanacar$Q2 - 0.122348*BaseCanacar$Q3

BaseCanacar$Y_s2 <- 0

for (i in 57:79){BaseCanacar$Y_s2[i] <- BaseCanacar$DY_s[i] + BaseCanacar$Y_s2[i-1]}

BaseCanacar$Y_s[BaseCanacar$COLUS == 0] <- BaseCanacar$Y

for (i in 57:79){BaseCanacar$Y_s[i] <- BaseCanacar$Y_s[56] + BaseCanacar$Y_s2[i]}

ggplot(data=BaseCanacar, aes(x=T, y=DY_s, group = 1)) +
  geom_line(color = ifelse(BaseCanacar$COLUS == 1, "red", "blue")) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

BaseCanacar$Mark <- (BaseCanacar$Y - BaseCanacar$Y_s)/BaseCanacar$Y_s

cortecOLUS <- filter(BaseCanacar, COLUS == 1) #hacemos un corte con esos valores
View(cortecOLUS)

ggplot(data=cortecOLUS, aes(x=T, y=Mark, group = 1)) +
  geom_line() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))
