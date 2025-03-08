# Module # 8 Input/Output, string manipulation and plyr package

# Install and load required packages
library(plyr)

# Read the file
students <- read.table("C:/Users/norae/Downloads/Assignment 6 Dataset.txt", header = TRUE, sep = ",")

# View the dataset
students

# Calculate mean Grade by Sex using plyr
StudentMean <- ddply(students, "Sex", transform, Grade.Average = mean(Grade))
StudentMean

# Write the results to a file
write.table(StudentMean, "Sorted_Average.cvs", sep = ",")

# Filter using subset and grepl
i_students <- subset(students, grepl("[iI]", students$Name))
i_students

# Write the filtered dataset to a CSV file
write.table(i_students, "DataSubset.csv", sep = ",")
