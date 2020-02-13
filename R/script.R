# script para ler a tabela limpa
# os dados originais estao num xls

data <- read.table("data/ex_limpo1.txt", header = TRUE, sep = "\t", dec = ",")
head(data)
str(data)

table(data$especie)
mean(data$comprimento_da_sepala)
range(data$comprimento_da_sepala)
?boxplot

boxplot(data$comprimento_da_petala ~ data$especie, xlab = "Espécies", ylab = "Comprimento da petala (cm)", las = 1, xaxt = "n")

?axis
#levels(data$especie)
axis(1, at = 1:3, labels = c("I. setosa", "I. versicola", "I. virginica"))

# git add data/ex_limpo1.txt
# git add R/script.R
# git comit -m "msg"
#ver sempre "par" tipo help
#las = 1 girar o numero

####### exercicio tarde ########

# data<- sapply(files_path, read.csv)
# length(data) e head(data[[ ]]) tail/head(coord) head(splist)
# nrow(splist)
# names(coord) indica nome, dim(coord) indica dimensão, para fundir: marge, names(envir.cood)
# name(comm.df) [1:2] <- c("taxcode", "abundance") *concatenar nome*

install.packages("tidyverse")

library("tidyverse")

