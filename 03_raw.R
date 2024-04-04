# Importing the needed libraries
library(datasets)
library(MASS)
library(ggplot2)

# Let's see the first 6 items
head(mtcars)

# The various variables are 
# - mpg: Miles Per Gallon
# - hp: Horse Power
# and so on...

# Number of elements in the dataset
length(mtcars$mpg)

# Here is the summary of the dataset
summary(mtcars)

# Maybe we want to plot some data. We proceed to plot the distribution of the
# mpg variable:
plot(density(mtcars$mpg))

# This tells us that most of the cars have a mpg of ~18/20: it's a very
# powerful information. Let's print also the scatter plot:
plot(mtcars$mpg, mtcars$wt,
     main = "Miles Per Gallon over Weight",
     xlab = "Miles Per Gallon",
     ylab = "Weight")

# We proceed to do a comparison also with an histogram
hist(mtcars$mpg,
     main = "Histogram of Miles Per Gallon",
     xlab = "Miles per Gallon",
     ylab = "Count")

# If we want to run a t.test to compare the mean of mpg and the two groups of
# cars in the am variable (notice that it's a binary value)
t.test(mtcars$mpg ~ mtcars$am,
       var.equal = TRUE)    # Set this assumption that the variance is equal

# We notice that there is a great difference between the two groups
t.sim <- function(v1, v2, ns, lim) {
    n <- 50000  # The number of iterations to simulate the distribution of sample means
    sds <- sd(c(v1, v2))  # Calculate the standard deviation of the combined samples
    mu <- mean(c(v1, v2))  # Calculate the mean of the combined samples
    meanDIFF <- rep(NA, n)  # Initialize an empty vector to store the differences in sample means
    # Perform the simulation of sample means
    for (i in 1:n) {
        g <- rnorm(ns, mu, sds)  # Generate a random sample 'g' from a normal distribution with mean 'mu' and standard deviation 'sds'
        k <- rnorm(ns, mu, sds)  # Generate another random sample 'k' from the same distribution
        meanDIFF[i] <- mean(g) - mean(k)  # Calculate the difference in sample means and store it in the vector
    }
    # Plotting the histogram of the differences in sample means
    hist(meanDIFF, xlim = c(-lim, lim), xlab = "Difference of sample mean")  # Create a histogram to visualize the distribution of sample means
    ourDIFF <- mean(v1) - mean(v2)  # Calculate the difference in means for the original samples
    segments(ourDIFF, 0, ourDIFF, 10000, col = "red")  # Add a red vertical line to the histogram representing the difference in means of the original samples
}

t.sim(
    mtcars[mtcars$am == 0, "mpg"],
    mtcars[mtcars$am == 1, "mpg"],
    20,
    10
)

# Let's try to plot data with `ggplot`
gg_plot_test <- ggplot(mtcars, aes(x = mpg, y = wt, color = factor(cyl)))

# Customize plot labels
# 'labs' function is used to customize the plot labels.
# 'title = "MPG vs Weight"' sets the title of the plot as "MPG vs Weight",
# 'x = "Miles per Gallon"' sets the label for the x-axis as "Miles per Gallon",
# 'y = "Weight"' sets the label for the y-axis as "Weight".
gg_plot_test + geom_point() + labs(
    title = "MPG vs Weight",
    x = "Miles per Gallon",
    y = "Weight")
    # + theme_classic() # In order to select a specific theme for the plot,
                        # we can use some themes defined in ggplot2
