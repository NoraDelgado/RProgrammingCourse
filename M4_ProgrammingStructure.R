# Load data
Frequency <- c(0.6, 0.3, 0.4, 0.4, 0.2, 0.6, 0.3, 0.4, 0.9, 0.2)
BP <- c(103, 87, 32, 42, 59, 109, 78, 205, 135, 176)
First <- c(1, 1, 1, 1, 0, 0, 0, 0, NA, 1)
Second <- c(0, 0, 1, 1, 0, 0, 1, 1, 1, 1)
FinalDecision <- c(0, 1, 0, 1, 0, 1, 0, 1, 1, 1)
# Create dataframe
data <- data.frame(Frequency, BP, First, Second, FinalDecision)

# Set up the plotting area
par(mfrow = c(1, 2))
# Boxplot for BP
boxplot(data$BP, main = "Blood Pressure Boxplot", col = "lightblue", ylab = "Blood Pressure")
# Histogram for BP
hist(data$BP, main = "Blood Pressure Histogram", col = "lightgreen", xlab = "Blood Pressure", breaks = 5)

# Boxplots for First and Second assessments
# Reset the plotting area for side by side
par(mfrow = c(1, 2))  
#Boxplot for First Assessment
boxplot(data$First, name = "First Assessment",
        main = "First Assessment", col = c("lightcoral"), xlab = "MD Ratings", ylab = "0 = Good, 1 = Bad")
#Boxplot for Second Assessment
boxplot(data$Second, name = "Second Assessment",
        main = "Second Assessment", col = c("lightcyan"), xlab = "MD Ratings", ylab = "0 = Good, 1 = Bad")


# Histograms for First and Second assessments
# Reset the plotting area for side by side
par(mfrow = c(1, 2))  
# Histogram for First Assessment (excluding NA)
hist(data$First[!is.na(data$First)], main="First Assessment", 
     xlab="0 = good, 1 = bad", ylab="Frequency", breaks = 2, col="lightgreen")
# Histogram for Second Assessment
hist(data$Second, main="Second Assessment", 
     xlab="0 = low, 1 = high", ylab="Frequency", breaks = 2, col="lightcoral")
