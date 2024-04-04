# Lesson from file 06
library(ggplot2)  # For creating visualizations
library(reshape2) # For reshaping data

data(iris)
hist(iris$Sepal.Length,
     main = "Histogram",
     xlab = "Sepal Length",
     ylab = "Frequency")


# Probability Density Function
ggplot(data.frame(x = iris$Sepal.Length), aes(x = x)) +
    stat_function(
        fun = dnorm, 
        args = list(mean = mean(iris$Sepal.Length), 
        sd = sd(iris$Sepal.Length)),
        color = "blue") +
    labs(title = "PDF", x = "Sepal Length", y = "Density")

# Heat Map
matrix_data <- cor(iris[, 1:4])  # Calculate correlation matrix
heatmap(matrix_data, col = cm.colors(256))
