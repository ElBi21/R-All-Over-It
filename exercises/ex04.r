# Install the packages needed for the exercise
install.packages(c("datasets", "ggplot2"))

# Call the packages
library(datasets)
library(ggplot2)

# Perform a summary and head in order to have an idea of the dataset
summary(mtcars)
head(mtcars)

# Select the cars with cyll == 4 or cyl == 6
mtcars_mpg_corr <- mtcars$mpg[mtcars$cyl == 4 | mtcars$cyl == 6]
mtcars_cyl_corr <- mtcars$cyl[mtcars$cyl == 4 | mtcars$cyl == 6]

# Prepare the box plot, which compares the mpg of the cars with
# cyl == 4 and with cyl == 6
boxplot(mtcars_mpg_corr ~ mtcars_cyl_corr,
        
        # Eyecandy
        names = c("4 Cylinders", "6 Cylinders"),
        col = c("#DF98A4", "#DFB098"),
        xlab = "Number of cylinders",
        ylab = "Miles per Gallon (mpg)")

# Performing the t-test of the cars' mpg with cyl equal to 4 or 6
t.test(
    mtcars$mpg[mtcars$cyl == 4 | mtcars$cyl == 6] ~ 
    mtcars$cyl[mtcars$cyl == 4 | mtcars$cyl == 6],
    var.equal=TRUE)

# Alternative version of the t-test with the pre-stored variables
# t.test(mtcars_mpg_corr ~ mtcars_cyl_corr, var.equal = TRUE)

hist(mtcars$mpg[mtcars$cyl == 4],
     xlab="Miles per Gallon (mpg)",
     main="Histogram of mpg's for cars with 4 cylinders")

hist(mtcars$mpg[mtcars$cyl == 6],
     xlab="Miles per Gallon (mpg)",
     main="Histogram of mpg's for cars with 6 cylinders")

median(mtcars$mpg[mtcars$cyl == 4])
median(mtcars$mpg[mtcars$cyl == 6])

length(mtcars$mpg[mtcars$cyl == 4])

sort(mtcars$mpg[mtcars$cyl == 4])
