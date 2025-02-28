# Load libraries
library(tidyverse)  # Includes ggplot2 and dplyr

# Load dataset
data(mtcars)

# Create a histogram 1
ggplot(mtcars, aes(x = mpg)) + 
  
  # Histogram with consistent bin width
  geom_histogram(
    binwidth = 3,              
    fill = "dodgerblue",       
    color = "black",           
    alpha = 0.8                
  ) +
  
  # Overlay a density curve
  geom_density(aes(y = ..count..), color = "red", size = 1) +
  
  # Add labels and title
  labs(
    title = "Distribution of Miles per Gallon (MPG)",
    subtitle = "A histogram with density overlay",
    x = "Miles per Gallon",
    y = "Number of Cars",
    caption = "Data source: mtcars dataset"
  ) +
  
  # Adjust x and y axis
  scale_x_continuous(
    breaks = seq(10, 35, by = 5)
  ) + 
  scale_y_continuous(breaks = seq(0, 12, by = 1)) +  
  
  # Apply a minimal theme with clean styling
  theme_minimal() +
  theme(
    plot.title = element_text(size = 16, face = "bold", hjust = 0.5),
    plot.subtitle = element_text(size = 12, face = "italic", hjust = 0.5),
    axis.title = element_text(size = 14),
    axis.text = element_text(size = 12),
    panel.grid.major = element_line(color = "gray80", size = 0.5),  # Major grid lines
    panel.grid.minor = element_line(color = "gray90", size = 0.3)
  )


# Calculate mean and median of MPG
avg <- mean(mtcars$mpg) 
med <- median(mtcars$mpg)

# Create custom annotations for mean and median
annot1 <- grobTree(
  textGrob(paste("Mean (red line)=", round(avg, 2)), x = 0.70, y = 0.95, hjust = 0, 
           gp = gpar(col = "black", fontsize = 9))
)

annot2 <- grobTree(
  textGrob(paste("Median (black line)=", round(med, 2)), x = 0.70, y = 0.80, hjust = 0, 
           gp = gpar(col = "black", fontsize = 9))
)

# Create a histogram 2 
ggplot(mtcars, aes(x = mpg)) + 
  
  # Histogram with consistent bin width
  geom_histogram(
    binwidth = 3,              
    fill = "dodgerblue",       
    color = "black",           
    alpha = 0.8                
  ) +
  
  # Add labels and title
  labs(
    title = "Distribution of Miles per Gallon (MPG)",
    subtitle = "A histogram with mean and median overlay",
    x = "Miles per Gallon",
    y = "Number of Cars",
    caption = "Data source: mtcars dataset"
  ) +
  
  # Adjust x and y axis breaks
  scale_x_continuous(
    breaks = seq(10, 35, by = 5)  
  ) +
  scale_y_continuous(breaks = seq(0, 12, by = 1)) +  
  geom_vline(xintercept = avg, color = "red", size = 2) +  
  geom_vline(xintercept = med, color = "black", size = 2) +  
  annotation_custom(annot1) + 
  annotation_custom(annot2) +
  
  # Apply a minimal theme with clean styling
  theme_minimal() +
  theme(
    plot.title = element_text(size = 16, face = "bold", hjust = 0.5),
    plot.subtitle = element_text(size = 12, face = "italic", hjust = 0.5),
    axis.title = element_text(size = 14),
    axis.text = element_text(size = 12),
    panel.grid.major = element_line(color = "gray80", size = 0.5),  # Major grid lines
    panel.grid.minor = element_line(color = "gray90", size = 0.3)
  )


# Create a histogram 3
ggplot(mtcars, aes(x = hp)) + 
  
  # Histogram with consistent bin width
  geom_histogram(
    binwidth = 20,              
    fill = "darkgreen",       
    color = "black",           
    alpha = 0.8                
  ) +
  
  # Overlay a density curve
  geom_density(aes(y = ..count.. * 20), color = "red", size = 1) +
  
  # Add labels and title
  labs(
    title = "Distribution of Horsepower",
    subtitle = "A histogram with density overlay",
    x = "Horsepower",
    y = "Number of Cars",
    caption = "Data source: mtcars dataset"
  ) +
  
  # Adjust x and y axis breaks
  scale_x_continuous(
    breaks = seq(50, 350, by = 50)  
  ) +
  scale_y_continuous(breaks = seq(0, 12, by = 1)) + 
  
  # Apply a minimal theme with clean styling
  theme_minimal() +
  theme(
    plot.title = element_text(size = 16, face = "bold", hjust = 0.5),
    plot.subtitle = element_text(size = 12, face = "italic", hjust = 0.5),
    axis.title = element_text(size = 14),
    axis.text = element_text(size = 12),
    panel.grid.major = element_line(color = "gray80", size = 0.5),  # Major grid lines
    panel.grid.minor = element_line(color = "gray90", size = 0.3)
  )


# Calculate mean and median of HP
avg <- mean(mtcars$hp)
med <- median(mtcars$hp)

# Create custom annotations for mean and median
annot1 <- grobTree(
  textGrob(paste("Mean (red line)=", round(avg, 2)), x = 0.70, y = 0.95, hjust = 0, 
           gp = gpar(col = "black", fontsize = 9))
)

annot2 <- grobTree(
  textGrob(paste("Median (black line)=", round(med, 2)), x = 0.70, y = 0.80, hjust = 0, 
           gp = gpar(col = "black", fontsize = 9))
)

# Create a histogram 4
ggplot(mtcars, aes(x = hp)) + 
  
  # Histogram with consistent bin width
  geom_histogram(
    binwidth = 20,              
    fill = "darkgreen",       
    color = "black",           
    alpha = 0.8                
  ) +
  
  # Add labels and title
  labs(
    title = "Distribution of Horsepower",
    subtitle = "A histogram with mean and median overlay",
    x = "Horsepower",
    y = "Number of Cars",
    caption = "Data source: mtcars dataset"
  ) +
  
  # Adjust x and y axis breaks
  scale_x_continuous(
    breaks = seq(50, 350, by = 50)
  ) +
  scale_y_continuous(breaks = seq(0, 12, by = 1)) +  
  geom_vline(xintercept = avg, color = "red", size = 2) +  
  geom_vline(xintercept = med, color = "black", size = 2) +  
  annotation_custom(annot1) + 
  annotation_custom(annot2) +
  
  # Apply a minimal theme with clean styling
  theme_minimal() +
  theme(
    plot.title = element_text(size = 16, face = "bold", hjust = 0.5),
    plot.subtitle = element_text(size = 12, face = "italic", hjust = 0.5),
    axis.title = element_text(size = 14),
    axis.text = element_text(size = 12),
    panel.grid.major = element_line(color = "gray80", size = 0.5),  # Major grid lines
    panel.grid.minor = element_line(color = "gray90", size = 0.3)
  )

