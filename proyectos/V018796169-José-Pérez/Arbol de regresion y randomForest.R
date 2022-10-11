library(readxl) ##llamamos a la libreria para lectura de los datos
library(rpart)   ##llamamos a la libreria para trabajar con el arbol de regresion.
library(rpart.plot) ##llamamos a la libreria para trabajar con graficos para el arbol de regresion.


setwd("C:/Users/David/Desktop/arboles de regresion")

BTC1 <- read_excel("BTC1.xlsx") #hacemos lectura de nuestros datos de la moneda Bitcoin.
View(BTC1)  #observamos los datos con estilo de hoja de calculo como la de excel.
set.seed(345)  # establecemos una semilla 345 para la reproduccion de los datos sea la misma.
entrenamiento<-sample(1:1734, 1214)   #para nuestro entranamiento, contiene el 70% de los datos
archivo_entrenamiento <- BTC1[entrenamiento, ]
archivo_prueba <- BTC1[-entrenamiento, ]  #contendra el 30% de los datos restantes.

#Generamos nuestro primer modelo para nuestro Arbol de regresion con la moneda Bitcoin.
m1 <- rpart(
  formula = AdjClose ~.,
  data    = archivo_entrenamiento,
  method  = "anova"
) 

#imprime por pantalla los resultados obtenidos por nuestro modelo m1.
m1

rpart.plot(m1)
m1$cptable
plotcp(m1)  

#Generamos la predicción para nuestro m1 con los datos de prueba:
pred <- predict(m1, archivo_prueba)

#imprime por pantalla lo resultados obtenidos de pred
pred

#calculamos el error de prediccion (RMSE)
sqrt (mean((pred - archivo_prueba$AdjClose) ^ 2))


#######ajutamos nuestro modelo######

BTC1 <- read_excel("BTC1.xlsx") #hacemos lectura de nuestros datos de la moneda Bitcoin.#
View(BTC1)  #observamos los datos con estilo de hoja de calculo como la de excel.#
set.seed(345)  # establecemos una semilla 345 para la reproduccion de los datos sea la misma.#
entrenamiento<-sample(1:1734, 1214)   #para nuestro entranamiento, contiene el 70% de los datos#
archivo_entrenamiento <- BTC1[entrenamiento, ]
archivo_prueba <- BTC1[-entrenamiento, ]  #contendra el 30% de los datos restantes.#

#Generamos el modelo m2 para nuestro Arbol de regresion con la moneda Bitcoin.#
m2 <- rpart(
  formula = AdjClose ~ .,
  data    = archivo_entrenamiento,
  method  = "anova", 
  control = list(cp = 0, xval = 10)
)

#imprime por pantalla los resultados obtenidos por nuestro modelo m2.#
m2


rpart.plot(m2)
m2$cptable
plotcp(m2)

#Generamos la predicción para nuestro m2 con los datos de prueba:#
pred <- predict(m2, archivo_prueba)

#imprime por pantalla lo resultados obtenidos de pred#
pred

#calculamos el error de prediccion (RMSE)##
sqrt (mean((pred - archivo_prueba$AdjClose) ^ 2))



##Aplicación del modelo con la herramienta R.##
## Moneda Ethereum##

ETH <- read_excel("ETH.xlsx") #hacemos lectura de nuestros datos de la moneda Ethereum.#
View(ETH)  #observamos los datos con estilo de hoja de calculo como la de excel.#

set.seed(345)  # establecemos una semilla 345 para la reproduccion de los datos sea la misma.#
entrenamientoETH<-sample(1:1734, 1214) #para nuestro entranamiento, contiene el 70% de los datos#
archivo_entrenamientoETH <- ETH[entrenamientoETH, ]
archivo_pruebaETH <- ETH[-entrenamientoETH, ]  #contendra el 30% de los datos restantes.#

#Generamos el modelo m3 para nuestro Arbol de regresion con la moneda Ethereum.#
m3 <- rpart(
  formula = AdjClose ~.,
  data    = archivo_entrenamientoETH,
  method  = "anova"
) 

#imprime por pantalla los resultados obtenidos por nuestro modelo m3.#
m3


rpart.plot(m3)
m3$cptable
plotcp(m3)  

#Generamos la predicción para nuestro m3 con los datos de prueba:#
predETH <- predict(m3, archivo_pruebaETH)

#imprime por pantalla lo resultados obtenidos de predETH#
predETH

#calculamos el error de prediccion (RMSE)##
sqrt (mean((predETH - archivo_pruebaETH$AdjClose) ^ 2))


#ajutamos nuestro modelo para Ethereum.#

ETH <- read_excel("ETH.xlsx") #hacemos lectura de nuestros datos de la moneda Ethereum.#
View(ETH)  #observamos los datos con estilo de hoja de calculo como la de excel.#

set.seed(345)  # establecemos una semilla 345 para la reproduccion de los datos sea la misma.#
entrenamientoETH<-sample(1:1734, 1214) #para nuestro entranamiento, contiene el 70% de los datos#
archivo_entrenamientoETH <- ETH[entrenamientoETH, ]
archivo_pruebaETH <- ETH[-entrenamientoETH, ]  #contendra el 30% de los datos restantes.#

#Generamos el modelo m4 para nuestro Arbol de regresion con la moneda Ethereum.#
m4 <- rpart(
  formula = AdjClose ~ .,
  data    = archivo_entrenamientoETH,
  method  = "anova", 
  control = list(cp = 0, xval = 10)
)

#imprime por pantalla los resultados obtenidos por nuestro modelo m4.#
m4


rpart.plot(m4)
m4$cptable
plotcp(m4)

#Generamos la predicción para nuestro m4 con los datos de prueba:#
predETH <- predict(m4, archivo_pruebaETH)

#imprime por pantalla lo resultados obtenidos de predETH#
predETH

#calculamos el error de prediccion (RMSE)##
sqrt (mean((predETH - archivo_pruebaETH$AdjClose) ^ 2))

# Modelo randomForest para moneda Bitcoin.

library(randomForest) #llamamos a la libreria para trabajar con los bosques aleatorios

BTC_rf <- read_excel("BTC1.xlsx") #hacemos lectura de nuestros datos de la moneda Bitcoin.
View(BTC_rf) #observamos los datos con estilo de hoja de calculo como la de excel.
set.seed(345) # establecemos una semilla 345 para la reproduucion de los datos sea la misma, en este caso a la hora de crear nuestro entrenamiento y pruebas.
entrenamiento_rf<-sample(1:1734, 1214) #para nuestro entranamiento, contiene el 70% de los datos
archivo_entrenamiento_rf <- BTC_rf[entrenamiento_rf, ]
archivo_prueba_rf <- BTC_rf[-entrenamiento_rf, ]#contendra el 30% de los datos restantes.

#Generamos nuestro primer modelo para nuestro bosque aleatorio con la moneda Bitcoin.
BIt_rf <- randomForest(AdjClose ~ ., data=archivo_entrenamiento_rf, 
                      ntree=400, mtry=5,
                      proximity=TRUE)

#imprime por pantalla lo resultados obtenidos por nuestro modelo BIt_rf de bosque aleatorio.
BIt_rf

#Generamos la predicción para nuestro BIt_rf con los datos de prueba:
predBTC1 <- predict(BIt_rf, archivo_prueba_rf)

#imprime por pantalla lo resultados obtenidos de predBTC1.
predBTC1

#calculamos el error de prediccion (RMSE)
sqrt (mean((predBTC1 - archivo_prueba_rf$AdjClose) ^ 2))




# Modelo randomForest para moneda Ethereum.

ETH_rf <- read_excel("ETH.xlsx") #hacemos lectura de nuestros datos de la moneda Ethereum.
View(ETH_rf) #observamos los datos con estilo de hoja de calculo como la de excel.

set.seed(345) # establecemos una semilla 345 para la reproduucion de los datos sea la misma, en este caso a la hora de crear nuestro entrenamiento y pruebas.
entrenamientoETH_rf<-sample(1:1734, 1214) #para nuestro entranamiento, contiene el 70% de los datos
archivo_entrenamientoETH_rf <- ETH_rf[entrenamientoETH_rf, ]
archivo_pruebaETH_rf <- ETH_rf[-entrenamientoETH_rf, ] #contendra el 30% de los datos restantes.


#Generamos nuestro primer modelo para nuestro bosque aleatorio con la moneda Ethereum.
ETH1_rf <- randomForest(AdjClose ~ ., data=archivo_entrenamientoETH_rf, 
                      ntree=400, mtry=2,
                      proximity=TRUE)

#imprime por pantalla lo resultados obtenidos por nuestro modelo ETH1_rf de bosque aleatorio.
ETH1_rf
#Generamos la predicción para nuestro ETH1_rf con los datos de prueba:
predETH1 <- predict(ETH1_rf, archivo_pruebaETH_rf)

#imprime por pantalla lo resultados obtenidos de predETH1.
predETH1

#calculamos el error de prediccion (RMSE)
sqrt (mean((predETH - archivo_pruebaETH$AdjClose) ^ 2))
