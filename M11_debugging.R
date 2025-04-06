# Load package
#install.packages("lares")
library(lares)

# Test dataset
data <- matrix(rnorm(100), nrow = 10, ncol = 10)

# Function
tukey_multiple <- function(x) {
  outliers <- array(TRUE, dim = dim(x))
  for (j in 1:ncol(x)) {
    outliers[, j] <- outliers[, j] & outlier_turkey(x[, j])
  }
  outlier.vec <- vector(length = nrow(x))
  for (i in 1:nrow(x)) {
    outlier.vec[i] <- all(outliers[i, ])
  }
  return(outlier.vec)
}

#Test function
tukey_multiple(data)

