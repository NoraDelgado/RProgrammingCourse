# Define matrices
A <- matrix(1:100, nrow=10)
B <- matrix(1:1000, nrow=10)

# Find determinant of A
det(A)
# Find inverse of A
#solve(A)
# Error: A is singular, inverse does not exist

#Find determinant of B
#det(B)
# Error: B is not a square matrix

# Transpose matrices
tA <- t(A)
print("Transpose of A:")
print(tA)
tB <- t(B)
print("Transpose of B:")
print(tB)

# Create vectors
a <- c(1:10)
b <- c(1:100)

# Multiply matrices by vectors
result_a <- A %*% a
result_b <- B %*% b
print("Matrix-vector A*a multiplication:")
print(result_a)
print("Matrix-vector B*b multiplication:")
print(result_b)

# Reassign the vectors to match the number of rows of the column
a <- rep(1, nrow(A))
b <- rep(1, nrow(B))

# Multiply matrix by matrix
A_times_B <- A %*% B
print("Matrix-matrix multiplication A*B):")
print(A_times_B)

# Create matrix S
S=matrix(2:5, nrow=2)

# Check determinant
det_S <- det(S)
print("Determinant of S:")
print(det_S)

# Inverse matrix S
nv_S <- solve(S)
print("Inverse of S:")
print(inv_S)
