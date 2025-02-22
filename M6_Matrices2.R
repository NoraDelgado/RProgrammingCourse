# Module # 6 assignment

# 1. Define matrices
A <- matrix(c(2, 0, 1, 3), ncol = 2)
A
B <- matrix(c(5, 2, 4, -1), ncol = 2)
B

# a) Find A + B
A_plus_B <- A + B
print(A_plus_B)

# b) Find A - B
A_minus_B <- A - B
print(A_minus_B)

# 2. Create a diagonal matrix of size 4 with given diagonal values
diag_matrix <- diag(c(4, 1, 2, 3))
print(diag_matrix)

# 3. Generate the specified matrix
# Create a 5x5 diagonal matrix with 3s
matrix <- diag(3, 5, 5)  
# Fill the first column with 2 (except first row)
matrix[2:5, 1] <- 2
# Add 1s in first row (except first column)
matrix[1,2:5] <- 1
print(matrix)

