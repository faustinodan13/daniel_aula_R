# script para ler a tabela limpa
# os dados originais estao num xls

data <- read.table("data/ex_limpo1.txt", header = TRUE, sep = "\t", dec = ",")
head(data)
str(data)

table(data$especie)
mean(data$comprimento_da_sepala)
range(data$comprimento_da_sepala)
?boxplot

boxplot(data$comprimento_da_petala ~ data$especie, xlab = "Espécies", ylab = "Comprimento da petala (cm)", las = 1, xaxt = "n", col = 7, pch = 19)

# fig.cap= ""
# para mudar  a cor col = "nome da cor em inglês"
# mudar icone pch = numeros"
# bty = numero (não fechar o quadrado)
# type "l" lty = 1 (gráfico em linha, não em barra)

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

## chave do git hub - ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCSfJNXUCHXZ9jzjn5/agk8AeHKNpnDknso4i1fW/QPYgxT/DdsQ1IcIgqx3SOYI29uX+Jbh9MP1LV/MGmPrL5vjzjMUZx7HW5dg/34zGCRJyTvDOHetIi8QVAdNDUT6v0Ugv1iBYlkeM9JK/ZcG6UC6k87pjSyIofGo5yeDVnTCzcv8CbzCptR7z7ncd4a9onqeY0jEXQw1t2cfUwLi75WDIPlGZZ1CghtT+j9Xw2z1hjRIov3245tWKh75Xk1SZ8oO135DecXzJyKq/MaSRAMI0uEiUsHZNgi9MGdi8j2L/R3zGH4T/VZXGcFV8Gyi/Nz5GEec26CX3SzpD/fFWf5 daniel faustino@DESKTOP-DPAGEFU ##

# ?par (lista de argumentos)

