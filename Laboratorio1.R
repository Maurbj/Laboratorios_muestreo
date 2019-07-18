# Muestreo, Semestre 2020-1
# Laboratorio 1: "Lectura de la ENIGH 2016
# Elaboró: Mauricio Roberto Juárez Feria 
# Contacto: maurbj@ciencias.unam.mx

# Objetivo: Aprender comandos y funciones básicas para manejo de bases de datos usando la base
# concentradohogar.dbf de la ENIGH 2016.

# descripción de las variables principales, identificación de vars. diseño.
# Uso de funciones estándar que permiten: hacer subconjuntos de la base, unir dos bases 
# usando una variable llave, tablas de frecuencias, resúmenes de variables, 
# cálculo de estadísticas básicas (media, varianza, cuantiles), gráficas de barras e histogramas.

# Requisitos de la práctica: Descargar la base de datos concentradohogar.dbf de la ENIGH 2016
# > Entrar a https://www.inegi.org.mx/programas/enigh/nc/2016/default.html
# > Seleccionar Microdatos
# > Seleccionar DBF (12.2MB) a la derecha de Principales varibles por hogar 
# > Seleccionar PDF (2.63MB) a la derecha de Descriptor de archivos (FD) 


rm(list=ls())

#- Establecer librería de trabajo
setwd("~/Documents/Muestreo 2020-1/Laboratorios_Muestreo/Microdatos")

#- Leer información de un archivo .dbf con la función 'read.bdf' del paquete 'foreign'
#install.packages('foreign')
library(foreign)
concentradohogar<-read.dbf("concentradohogar.dbf") 

#- Dimensión de la base
dim(concentradohogar)

#- Estructura de la base
str(concentradohogar)
str(concentradohogar,list.len=127)

#- Función summary
#---- Frecuencias para factores
#---- Cuantiles para variables continuas
summary(concentradohogar)
summary(concentradohogar$sexo_jefe)
summary(concentradohogar$edad_jefe)
summary(concentradohogar$ing_cor)

#- Seleccionar filas y columnas específicas
concentradohogar[1,]

concentradohogar[1:3,]

concentradohogar[1:3,1:10]

concentradohogar[c(3,7,13),c(1,12,24)]

concentradohogar[1:10,]$edad_jefe

concentradohogar[1:10,colnames(concentradohogar) %in% c('sexo_jefe','edad_jefe','ing_cor')]

concentradohogar[1:10,c(rep(F,20),rep(T,7),rep(F,100))]

nrow(concentradohogar[concentradohogar$edad_jefe<=18,])

nrow(with(concentradohogar,concentradohogar[edad_jefe<=18 & ing_cor>=40000,]))


table(concentradohogar$sexo_jefe,concentradohogar$educa_jefe)

jefe_menor18<-with(concentradohogar,concentradohogar[edad_jefe<=18,])
with(jefe_menor18,table(sexo_jefe,educa_jefe))

