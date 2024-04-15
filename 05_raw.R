# Load required libraries
library(ggplot2)  # For creating visualizations

# Dataset: Iris
data(iris)

# Scatter plot
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
    geom_point() +
    labs(title = "Scatter Plot of Sepal Length vs. Sepal Width", x = "Sepal Length", y = "Sepal Width")

# Scatter plots are used also for making clustering analysis, so to separate the
# data depending on some variables

# Line plot
ggplot(iris, aes(x = Petal.Length, y = Petal.Width, color = Species, group = Species)) +
    geom_line() +
    labs(title = "Line Plot of Petal Length vs. Petal Width", x = "Petal Length", y = "Petal Width")

# With this plot it's possible to see if there is any mathematical correlation
# between the variables

