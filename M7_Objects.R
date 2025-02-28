# Module # 7 R Object: S3 vs. S4 assignment

# Install package
#install.packages("pryr")
# Load package
library(pryr)


# Load dataset
data("iris")
# Inspect dataset
head(iris)

# Check if generic functions can be applied
print(iris)
summary(iris)
plot(iris)
# Yes, they can

# Check if S3 or S4 can be assigned
isS4(iris)
typeof(iris)
is.character(iris)
is.vector(iris)
# It’s S3

# Create S3 object
s3 <- list(first_name = "Mia", last_name = "Collins", phone = 8136189553) 
s3

class(s3)="customers"
attributes(s3)


#Create S4 object
setClass("customers", slots = list(first_name = "character", last_name = "character" , phone = "numeric"))

s4 <- new("customers", first_name = "Mia", last_name = "Collins", phone = 8136189553)
#check if it is S4 
otype(s4)
isS4(s4)