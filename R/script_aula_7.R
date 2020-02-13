## exercício 7 - análise exploratória ##

data("anscombe")
dim(anscombe)
head(anscombe)
class(anscombe)
str(anscombe)

mean(anscombe$x1)
mean(anscombe$x2)
mean(anscombe$x3)
mean(anscombe$x4)

apply(anscombe[,1:4], 2, mean)
apply(anscombe[,5:8], 2, mean)

apply(anscombe, 2, var)

cor(anscombe$x1, anscombe$y1)
cor(anscombe$x2, anscombe$y2)
cor(anscombe$x3, anscombe$y3)
cor(anscombe$x4, anscombe$y4)

m1 <- lm(anscombe$x1 ~ anscombe$y1)
m2 <- lm(anscombe$x2 ~ anscombe$y2)
m3 <- lm(anscombe$x3 ~ anscombe$y3)
m4 <- lm(anscombe$x4 ~ anscombe$y4)

mlist <- list(m1, m2, m3, m4)

lapply(mlist, coef)

anscombe

par(mfrow=c(2, 2),
    las=1,
    bty="l")

plot(anscombe$y1 ~ anscombe$x1)
abline(mlist[[1]])

plot(anscombe$y2 ~ anscombe$x2)
abline(mlist[[2]])

plot(anscombe$y3 ~ anscombe$x3)
abline(mlist[[3]])

plot(anscombe$y4 ~ anscombe$x4)
abline(mlist[[4]])

par(mfrow=c(1, 1))

head(iris)
summary(iris)

table(iris$Species)

tapply(X = iris$Sepal.Length, INDEX = list(iris$Species), FUN = mean)
aggregate(x = iris$Sepal.Length, by = list(iris$Species), FUN = mean)
aggregate(Sepal.Length ~ Species, data = iris, mean)
aggregate(Sepal.Length ~ Species, data = iris, mean)
aggregate(Sepal.Width ~ Species, data = iris, mean)
aggregate(Petal.Length ~ Species, data = iris, mean)

tapply(X = iris$Sepal.Length, INDEX = list(iris$Species), FUN = sd)
tapply(X = iris$Sepal.Width, INDEX = list(iris$Species), FUN = sd)
tapply(X = iris$Petal.Length, INDEX = list(iris$Species), FUN = sd)
tapply(X = iris$Petal.Width, INDEX = list(iris$Species), FUN = sd)

medias <- matrix(NA, ncol = 3, nrow = 4)
colnames(medias) <- unique(iris$Species)
rownames(medias) <- names(iris)[-5]

for (i in 1:4){
  medias[i,] <- tapply(iris[,i], iris$Species, mean)
}

vars <- iris[, -5]
apply(vars, 2, mean)

apply(vars, 2, median)
freq_sl <- sort(table(iris$Sepal.Length), decreasing = TRUE)
freq_sl[1]

apply(vars, 2, var)
sd01 <- apply(vars, 2, sd)

cv <- function(x){
  sd(x)/mean(x)*100
  }
apply(vars, 2, cv)

apply(vars, 2, quantile)
apply(vars, 2, quantile, probs=c(0.05, 0.5, 0.95))

apply(vars, 2, range)
my_range <- function(x){
  diff(range(x))
}

apply(vars, 2, my_range)

apply(vars, 2, IQR)

cor(vars)

barplot(table(iris$Species))
par(mfrow=c(2,2))

hist(iris$Sepal.Length)
hist(iris$Sepal.Width)
hist(iris$Petal.Length)
hist(iris$Petal.Length)

par(mfrow=c(1, 1))

par(mfrow=c(1,2))
hist(iris$Sepal.Width)
hist(iris$Sepal.Width, breaks = 4)

par(mfrow=c(1, 1))

par(mfrow=c(1, 2))

plot(density(iris$Sepal.Width))
hist(iris$Sepal.Width, freq = FALSE)

par(mfrow=c(1, 1))

par(mfrow=c(1, 2))

plot(density(iris$Sepal.Width))
hist(iris$Sepal.Width, freq = FALSE)
lines(density(iris$Sepal.Width), col="blue")

par(mfrow=c(1, 1))

boxplot(iris$Sepal.Length)
boxplot(iris$Sepal.Width)
boxplot(iris$Petal.Length)
boxplot(iris$Petal.Width)

boxplot(Sepal.Length ~ Species, data = iris)
boxplot(Sepal.Width ~ Species, data = iris)
boxplot(Petal.Length ~Species, data = iris)
boxplot(Petal.Width ~ Species, data = iris)

boxplot(iris$Sepal.Width)

my_boxplot <- boxplot(iris$Sepal.Width, plot = FALSE)
my_boxplot

outliers <- my_boxplot$out

which(iris$Sepal.Width %in% outliers)
iris[which(iris$Sepal.Width %in% outliers), c("Sepal.Width", "Species")]

boxplot(Sepal.Width ~ Species, data = iris)

my_boxplot2 <- boxplot(Sepal.Width ~Species, data = iris, plot = FALSE)
my_boxplot2

outliers2 <- my_boxplot2$out

iris[iris$Sepal.Width %in% outliers2 &
       iris$Species == "setosa",
     c("Sepal.Width", "Species")]


par(mfrow = c(1,3))
qqnorm(iris$Sepal.Length[iris$Species == "setosa"],
       main = "setosa")
qqline(iris$Sepal.Length[iris$Species == "setosa"])
qqnorm(iris$Sepal.Length[iris$Species == "versicolor"],
       main = "versicolor")
qqline(iris$Sepal.Length[iris$Species == "versicolor"])
qqnorm(iris$Sepal.Length[iris$Species == "virginica"],
       main = "virginica")
qqline(iris$Sepal.Length[iris$Species == "virginica"])

par(mfrow=c(1,1))

pairs(vars)

library("GGally")
#install.packages(GGally)

##instalar p pack acima e rodar para um novo gráfico##
