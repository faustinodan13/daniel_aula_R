# script para ler a tabela limpa
# os dados originais estao num xls

data <- read.table("data/ex_limpo1.txt", header = TRUE, sep = "\t", dec = ",")
head(data)
str(data)

git addtable(data$especie)
mean(data$comprimento_da_sepala)
range(data$comprimento_da_sepala)
?boxplot

boxplot(data$comprimento_da_petala ~ data$especie, xlab = "Espécies", ylab = "Comprimento da petala (cm)")

#git add data/ex_limpo1.txt
