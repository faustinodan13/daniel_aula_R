##### Exercício 8, figuras ##########

comm <- read.csv("data/cestes/comm.csv")
envir <- read.csv("data/cestes/envir.csv")

comm.pa <- comm[, -1] > 0
rich <- apply(X = comm.pa, MARGIN = 1, FUN = sum)
head(rich)


##[1] 6 4 3 6 3 3

summary(rich)

boxplot(rich)
boxplot(rich, las = 1)

localidades <- cbind(envir, rich)
head(localidades)

riqsilt <- lm(rich ~ Silt, data = localidades)
riqclay <- lm(rich ~ Clay, data = localidades)
riqsand <- lm(rich ~ Sand, data = localidades)

coef_s <- coef(riqsilt)
coef_c <- coef(riqclay)
corf_d <- coef(riqsand)

limy <- c(min(localidades$rich),
          max(localidades$rich))

limx <- c(min(localidades[,c("Clay", "Sand", "Silt")]),
          max(localidades[,c("Clay", "Sand", "Silt")]))

laby <- "Riqueza de espécies"

par(mfrow = c(1, 3),
    las = 1,
    bty = "l")

plot(rich ~ Silt, data = localidades,
     col = "tomato",
     ylim = limy, xlim = limx,
     ylab = laby,
     xlab = "teor de Silte (%)")

abline(a = coef_s[1], b = coef_s[2],
       col = "tomato", lwd =2)

mtext("A", 3, adj = 0, font = 2)


plot(rich ~ Clay, data = localidades,
     col = "navy",
     ylim = limy, xlim = limx,
     ylab = "",
     xlab = "Teor de Argila (%)")
mtext("B", 3, adj = 0, font = 2)

abline(a = coef_c[1],
       b = coef_c[2],
       col = "navy",
       lwd = 2)

plot(rich ~ Sand, data = localidades,
     col = "dodgerblue",
     ylim = limy, xlim = limx,
     ylab = "",
     xlab = "Teor de Areia (%)")


mtext("C", 3, adj = 0, font = 2)

abline(a = coef_c[1],
       b = coef_c[2],
       col = 'dodgerblue',
       lwd = 2)

png("figs/figura01.png", res = 300, width =  2400, height = 1200)

par(mfrow = c(1, 3),
    las = 1,
    bty = "l")

plot(rich ~ Silt, data = localidades,
     col = "tomato",
     ylim = limy, xlim = limx,
     ylab = laby,
     xlab = "Teor de Silte (%)")

abline(a = coef_s[1], b = coef_s[2],
       col = "tomato", lwd = 2)

mtext("A", 3, adj = 0, font = 2)

plot(rich ~ Clay, data = localidades,
     col = "navy",
     ylim = limy, xlim = limx,
     ylab = "",
     xlab = "Teor de Argila (%)")
mtext("B", 3, adj = 0, font = 2)

abline(a = coef_c[1],
       b = coef_c[2],
       col = 'navy',
       lwd = 2)

plot(rich ~ Sand, data = localidades,
     col = "dodgerblue",
     ylim = limy, xlim = limx,
     ylab = "",
     xlab = "Teor de Areia (%)")
mtext("C", 3, adj = 0, font = 2)

abline(a = coef_c[1],
       b = coef_c[2],
       col = 'dodgerblue',
       lwd = 2)

dev.off()

cores <- c("#3B9AB2", "#EBCC2A", "#F21A00")
sp <- paste("I.", unique(iris$Species), sep = " ")
par(mfrow = c(2, 2),
    mar = c(4, 1, 1, 1),
    bty = 'l',
    las = 1)
boxplot(Sepal.Length ~ Species,
        data = iris,
        xlab = "",
        col = cores,
        xaxt = "n")
axis(1, at = 1:3, labels = sp, font = 3)
boxplot(Sepal.Width ~ Species,
        data = iris,
        xlab = "",
        col = cores,
        xaxt = "n")
axis(1, at = 1:3, labels = sp, font = 3)
boxplot(Petal.Length ~ Species, data = iris,  col = cores,
        xaxt = "n")
axis(1, at = 1:3, labels = sp, font = 3)
boxplot(Petal.Width ~ Species,
        data = iris,
        col = cores,
        xaxt = "n")
axis(1, at = 1:3, labels = sp, font = 3)

par(mfrow = c(1, 1))

set.seed(42)
d2 <- data.frame(name = letters[1:5],
                 value = sample(seq(4, 15), 5),
                 sd = c(1, 0.2, 3, 2, 4))

plot(x = 1:5, d2$value, las = 1, bty = 'l',
     ylim = c(0, 18), pch = 19, xaxt = 'n',
     xlab = "names", ylab = "value")
axis(1, at = 1:5, labels = d2$name)
arrows(x0 = 1:5,
       y0 = d2$value + d2$sd,
       y1 = d2$value - d2$sd, angle = 90, length = 0.05, code = 3)

