install.packages("datasets", "ggplot2")
library(datasets)
library(ggplot2)

summary(mtcars)
head(mtcars)

unique(mtcars$cyl)

boxplot(mtcars$mpg[mtcars$cyl == 4],
        mtcars$mpg[mtcars$cyl == 6],
        names = c("4 Cylinders", "6 Cylinders"),
        col = c("#DF98A4", "#DFB098"),
        xlab = "Number of cylinders",
        ylab = "Miles per Gallon (mpg)")

mtcars$cyl[mtcars$cyl == 4 | mtcars$cyl == 6]

t.test(mtcars$mpg[mtcars$cyl == 4 | mtcars$cyl == 6] ~ mtcars$cyl[mtcars$cyl == 4 | mtcars$cyl == 6], var.equal=TRUE)

mtcars_mpg_corr <- mtcars$mpg[mtcars$cyl == 4 | mtcars$cyl == 6]
mtcars_cyl_corr <- mtcars$cyl[mtcars$cyl == 4 | mtcars$cyl == 6]
t.test(mtcars_mpg_corr ~ mtcars_cyl_corr, var.equal = TRUE)

