# Load necessary libraries
library(ggplot2)
#install.packages("grid")
library(grid)

# Load the mtcars dataset
data(mtcars)

# Calculate correlation coefficients
cor_hp_mpg <- cor(mtcars$hp, mtcars$mpg) 
cor_wt_mpg <- cor(mtcars$wt, mtcars$mpg) 

# Create custom annotation for correlation coefficient
annot1 <- grobTree(
  textGrob(paste("Correlation between Horsepower and MPG:", round(cor_hp_mpg, 2)), x = 0.40, y = 0.90, hjust = 0, 
           gp = gpar(col = "black", fontsize = 10))
)

annot2 <- grobTree(
  textGrob(paste("Correlation between Weight and MPG:", round(cor_wt_mpg, 2)), x = 0.48, y = 0.90, hjust = 0, 
           gp = gpar(col = "black", fontsize = 10))
)


# Create scatter plots for each pair of variables
# Scatter plot 1: mpg vs. hp
plot1 <- ggplot(mtcars, aes(x = hp, y = mpg)) +
  geom_point(color = "blue", size = 3, alpha = 0.7) +  # Add points
  geom_smooth(method = "lm", color = "red") +  # Add linear regression line
  labs(title = "MPG vs. Horsepower",
       x = "Horsepower (hp)",
       y = "Miles per Gallon (mpg)") +
        annotation_custom(annot1) +
  theme_minimal()  # Use a clean theme for clarity

plot1

# Scatter plot 2: mpg vs. wt
plot2 <- ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point(color = "green", size = 3, alpha = 0.7) +  # Add points
  geom_smooth(method = "lm", color = "orange") +  # Add linear regression line
  labs(title = "MPG vs. Weight",
       x = "Weight (1000 lbs)",
       y = "Miles per Gallon (mpg)") +
      annotation_custom(annot2) +
  theme_minimal()  # Use a clean theme for clarity

plot2