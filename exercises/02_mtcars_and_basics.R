# EXERCISE 1
# Linear Regression Exercise: 
# Perform a linear regression analysis using MPG as the dependent variable
# and weight (wt) as the independent variable. 
# Provide an interpretation of the coefficients

library(ggplot2)

fn <- lm(mtcars$mpg ~ mtcars$wt)
plot(lm(mtcars$mpg ~ mtcars$wt))

plot(mtcars$mpg ~ mtcars$wt,
     xlab = "Weight of a car",
     ylab = "Miles per Gallon")

# The lighter the car, the more miles it will do with one gallon of fuel

############################################

# EXERCISE 2
# Use ggplot2 to create a visualization that combines multiple variables 
# (e.g., MPG, cylinder count, and weight) in a creative way.

head(mtcars)

gg <- ggplot(mtcars, aes(x = mpg, y = wt, z = am, color = factor(am)))
gg + geom_point() + labs(
    title = "MPG vs Weight in Automatic and Manual Cars",
    x = "Miles per Gallon",
    y = "Weight",
    z = "Cylinders"
    )

############################################

# EXERCISE 3
# create a ggplot that includes the following elements:
# A scatter plot of MPG versus weight (wt), similar to what's already in the 
# script, but this time facet the plot by the number of gears (gear).
# Customize the plot using a different ggplot2 theme and adjust the color 
# scale to represent the number of cylinders (cyl).
# Add a smooth line (regression line or LOESS) to each facet 
# to illustrate the trend.

gg3 <- ggplot(mtcars, aes(x = mpg, y = wt, color = factor(cyl)))
gg3 + geom_point() + labs(
    title = "MPG vs Weight in Automatic and Manual Cars",
    x = "Miles per Gallon",
    y = "Weight",
    z = "Cylinders"
) + theme_classic()


############################################

# EXERCISE 4 (DO IT!)
# Perform a t-test to compare the MPG of 4-cylinder cars versus 6-cylinder cars. 
# Before conducting the t-test visualize the distribution of MPG  for both groups 
# using box plots or violin plots.
# Provide an interpretation of the results of the t-test in the context of the visualizations.