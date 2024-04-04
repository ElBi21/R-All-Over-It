### Lesson of 27/03

library(ggplot2)
library(datasets)

s <- seq(0, 10, length.out = 100)
s

# Aggregated value: a value which describes the statistics of a set of data
normal_pdf <- dnorm(s, mean = 5, sd = 2)
normal_cdf <- pnorm(s, mean = 5, sd = 2)
normal_ccdf <- 1 - normal_cdf
ggplot(data.frame(x = s, y = normal_pdf), aes(x = s, y = y)) +
    geom_line(color = "#32418C") +
    labs(title = "Normal Distribution", x = "x", y = "PDF")

# CDF gives an important insight over the data set: it allows to know how many
# samples of the data (in percent) are below a certain value

# The CCDF is powerful as well: it allows to know in percent how many samples
# are above a certain value


# -----------


# ### Exercise 1: Normal Distribution and Iris Sepal Length
# 
# - **Objective**: Examine the distribution of Sepal Length in the iris dataset.
# - **Task**: Assuming Sepal Length follows a normal distribution, plot its PDF
# using the actual mean and standard deviation of Sepal Length in the iris
# dataset. Overlay the actual histogram of Sepal Length to compare the empirical
# distribution with the theoretical normal distribution. Discuss any deviations
# observed.

dts <- iris$Sepal.Length
sep_mean <- mean(dts)
sep_sd <- sd(dts)
norm_iris <- dnorm(dts, mean=sep_mean, sd=sep_sd)
norm_iris

dframe <- data.frame(x = iris$Sepal.Length, y = norm_iris)


# In order to have it scaled, pass to GGPLOT a dataframe, and define with aes()
# the only variable on the x axis
ggplot(dframe, aes(iris$Sepal.Length))  + 
    # On the histogram, the ..density.. notation will take the density of the
    # dataframe passed in input to ggplot
    geom_histogram(aes(y = ..density..), binwidth = 0.1, colour = "#32418C") + 
    # Then plot the curve, where the function is the normal density function
    stat_function(fun = dnorm, args = list(mean = mean(dframe$x), sd = sd(dframe$x)))

# ### Exercise 2: Uniform Distribution Assumption on Iris Petal Width
# 
# - **Objective**: Test a uniform distribution assumption for a variable.
# - **Task**: Suppose Iris Petal Width was uniformly distributed between its
# minimum and maximum values. Calculate these values and plot the uniform PDF
# over this range. Overlay a histogram of the actual Petal Width data. Does the
# uniform distribution seem like a good fit? Why or why not?

x <- iris$Sepal.Length
unif_sep <- dunif(x, min = min(x), max = max(x))
dframe2 <- data.frame(x = iris$Sepal.Length, y = norm_iris)

ggplot(dframe2, aes(iris$Sepal.Length))  + 
    # On the histogram, the ..density.. notation will take the density of the
    # dataframe passed in input to ggplot
    geom_histogram(aes(y = ..density..), binwidth = 0.1, colour = "#32418C") + 
    # Then plot the curve, where the function is the normal density function
    stat_function(fun = dunif, args = list(min = min(dframe$x), max = max(dframe$x)), color="#326f8C")

# No, it's not a good fit. The uniform distribution here doesn't tell us anything.

# ### Exercise 3: Exponential Distribution and Flower Characteristics
#   
# - **Objective**: Explore an exponential distribution fitting for time-related
# flower data.
# - **Task**: Imagine a scenario where the time between the flowering of one
# iris and the next follows an exponential distribution. Choose either the Sepal
# Length or Petal Length as a proxy for flowering time. Estimate the rate
# parameter (\(\lambda\)) as the inverse of the mean of your chosen variable.
# Plot the PDF and discuss the implications if flowering times indeed followed
# this distribution.


# Search ks.test(). What does it do?