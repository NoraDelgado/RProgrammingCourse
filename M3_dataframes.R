# Module # 3 Dataframes

# Define the names of the candidates
Name <- c("Jeb", "Donald", "Ted", "Marco", "Carly", "Hillary", "Bernie")

# Create vectors for poll results from ABC and CBS
ABC_results <- c(4, 62, 51, 21, 2, 14, 15)
CBS_results <- c(12, 75, 43, 19, 1, 21, 19)

# Combine all data into a data frame
poll_data <- data.frame(
  Candidate = Name,
  ABC_Poll = ABC_results,
  CBS_Poll = CBS_results
)

# Show the dataset
print(poll_data)

# Basic analysis


# Rank by CBS results
poll_results_CBS_ranked <- poll_data[order(-poll_data$CBS_Poll), ]
poll_results_CBS_ranked

# Rank by ABC results
poll_results_ABC_ranked <- poll_data[order(-poll_data$ABC_Poll), ]
poll_results_ABC_ranked

# Calculate the difference between ABC and CBS polls for each candidate
poll_difference <- poll_data$ABC_Poll - poll_data$CBS_Poll

# Add the difference to the data frame
poll_data$Poll_Difference <- poll_difference

# Print the updated data frame with differences
print(poll_data)