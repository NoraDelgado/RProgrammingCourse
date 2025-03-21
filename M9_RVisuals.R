# Load libraries
library(dplyr)
library(tidyr)
library(ggplot2)
library(lattice)

# Load the dataset
data <- read.csv("C:/Users/norae/Downloads/sowc_maternal_newborn.csv")

# Review the dataset
str(data)

# Select and rename columns
clean_data <- data %>%
  select(
    country = countries_and_areas,
    life_expect = life_expectancy_female,
    teen_birth = adolescent_birth_rate,
    maternal_mort = maternal_mortality_ratio_2017
  )

# Remove rows with NA values
clean_data <- clean_data %>%
  drop_na()

# View the cleaned dataset
head(clean_data)
str(clean_data)


# Scatterplot: life expectancy vs maternal mortality
ggplot(clean_data, aes(x = life_expect, y = maternal_mort)) +
  geom_point(color = "purple") +
  labs(title = "Life Expectancy vs Maternal Mortality Ratio", x = "Life Expectancy (Female)", y = "MMR")


# Histogram of Adolescent Birth Rate
hist(clean_data$teen_birth,
     main = "Distribution of Adolescent Birth Rate per Country (2013-2018)",
     xlab = "Adolescent Birth Rate (births per 1,000 teenage women)",
     col = "green", breaks = 20)

# Bar plot of top 10 countries by maternal mortality ratio
# Get the top 10 countries by maternal mortality ratio
top_10 <- head(clean_data[order(-clean_data$maternal_mort), ], 10)
# Make sure country is a factor
top_10$country <- factor(top_10$country, levels = top_10$country)
# Vertical bar plot using lattice
barchart(
  maternal_mort ~ country, 
  data = top_10,
  horizontal = FALSE,
  col = "skyblue",
  xlab = "Country",
  ylab = "Maternal Mortality Ratio",
  main = "Top 10 Countries by Maternal Mortality Ratio",
  scales = list(x = list(rot = 45, cex = 0.7)),  
  panel = function(...) {
    panel.grid(h = -1, v = 0, col = "black", lty = 3)  
    panel.barchart(...)
  }
)
