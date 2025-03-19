# Load necessary libraries
library(dplyr)
library(readr)
library(ggplot2)

# Load dataset
#df <- read_csv("C:/Users/norae/Downloads/Electric_Vehicle_Population_Data.csv")

# Select only key variables
#df_clean <- df %>%
  #select(Make, Model, `Model Year`, `Electric Vehicle Type`, `Electric Range`, County)

# Remove rows with too many missing values
#df_clean <- df_clean %>%
  #filter(!is.na(`Electric Range`), !is.na(County))

# Keep only vehicles from 2018 and later
#df_clean <- df_clean %>%
  #filter(`Model Year` >= 2018)

# Sample 1000 random rows to make it smaller
#set.seed(123)  # Ensure reproducibility
#df_sample <- df_clean %>%
  #sample_n(1000)

# Save cleaned dataset
#write_csv(df_sample, "Cleaned_Electric_Vehicles.csv")

# Use and review cleaned dataset
data <- read_csv("C:/Users/norae/Documents/Cleaned_Electric_Vehicles.csv")
head(data)
str(data)

# Rename variables
colnames(data) <- c("Make", "Model", "Model.Year", "Electric.Vehicle.Type", "Electric.Range", "County")

# Filter out rows with Electric Range = 0 
data <- data %>% filter(Electric.Range > 0)

# Remove 2025 from the dataset
data <- data %>% filter(Model.Year != 2025)

# Calculate the number of vehicles per Model Year and Electric Vehicle Type for annotations
count_per_year <- data %>%
  group_by(Model.Year, Electric.Vehicle.Type) %>%
  summarise(Vehicle_Count = n(), .groups = "drop")

# Create box plot 
ggplot(data, aes(x = as.factor(Model.Year), y = Electric.Range, fill = Electric.Vehicle.Type)) +
  geom_boxplot(alpha = 0.7, outlier.shape = NA) + 
  scale_fill_manual(values = c("Battery Electric Vehicle (BEV)" = "#1f77b4", 
                               "Plug-in Hybrid Electric Vehicle (PHEV)" = "#ff7f0e")) + 
  labs(title = "Electric Vehicle Range Distribution by Model Year and Vehicle Type",
       x = "Model Year",
       y = "Electric Range (miles)",
       fill = "Vehicle Type")
