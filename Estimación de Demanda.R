# BLPestimatoR - Package for Demand Estimation

library(BLPestimatoR)
nevos_model <- as.formula("share ~  price + productdummy |
    0+ productdummy |
    price + sugar + mushy |
    0+ IV1 + IV2 + IV3 + IV4 + IV5 + IV6 + IV7 + IV8 + IV9 + IV10 + 
    IV11 + IV12 + IV13 + IV14 + IV15 + IV16 + IV17 + IV18 + IV19 + IV20")

head(productData_cereal)
