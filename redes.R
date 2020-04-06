devtools::install_github("DougLuke/UserNetR")
# Redes
library(statnet)
library(UserNetR)
data(Moreno)
View(Moreno)

gender <- Moreno %v% "gender"
plot(Moreno, vertex.col = gender + 2, vertex.cex = 1.2)

summary(Moreno,print.adj=FALSE)