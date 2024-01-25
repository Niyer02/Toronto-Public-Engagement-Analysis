#### Preamble ####
# Purpose: Simulates data for a public engagement survey
# Author: Nikhil Iyer
# Date: 22 January 2024
# Contact: nik.iyer@mail.utoronto.ca
# License: MIT
# Pre-requisites: Dependencies installed


#### Work space setup ####
library(tidyverse)

#### Simulate data ####
set.seed(5) # for reproducibility

# Simulate data

# Example questions
example_questions <- c("I feel fairly represented in the city of Toronto.",
                       "I have actively attempted to engage with city officials to make a change.",
                       "The TTC is fairly priced.",
                       "I am confident in the overall direction that Toronto is headed.",
                       "Law enforcement does their job properly.")

# For the purpose of simulation, simulated data will only be on 5 example questions
# First column is a primary key which represents the persons unique identifier
# Rest of the columns are example questions with Boolean responses
simulated_data <- data.frame(
  person_pk = 1:100,
  example_questions1 = sample(c(1, 0), 100, replace = TRUE),
  example_questions2 = sample(c(1, 0), 100, replace = TRUE),
  example_questions3 = sample(c(1, 0), 100, replace = TRUE),
  example_questions4 = sample(c(1, 0), 100, replace = TRUE),
  example_questions5 = sample(c(1, 0), 100, replace = TRUE)
)

# Replace column names with the actual questions in the list above
colnames(simulated_data) <- c("person_pk",example_questions)

# Print the first couple of rows of simulated data
print(head(simulated_data))

# Note that all the example questions are created in a way s.t. '1' is positive, 
# and '0' is negative. This will be used to perform the sentiment analysis.
# The real data should be setup in a similar way.

q1_results <- sum(simulated_data$"I feel fairly represented in the city of Toronto." == 1)
q2_results <- sum(simulated_data$"I have actively attempted to engage with city officials to make a change." == 1)
q3_results <- sum(simulated_data$"The TTC is fairly priced." == 1)
q4_results <- sum(simulated_data$"I am confident in the overall direction that Toronto is headed." == 1)
q5_results <- sum(simulated_data$"Law enforcement does their job properly." == 1)

print("Simulated Data Positive Sentiment Results")
cat("Q1:", q1_results, " Q2:", q2_results, " Q3:", q3_results, " Q4:", q4_results, " Q5:", q5_results)

# Example: 
# Q1: 53  Q2: 51  Q3: 52  Q4: 48  Q5: 52
# From this we could conclude that the overall sentiment is neutral, or
# Slightly positive, which is expected as the random function will be roughly
# normally distributed.

#### Simulated Data Tests ####
numeric <- all(sapply(simulated_data, is.numeric))

# Print the result
if (numeric) {
  print("PASS")
} else {
  print("FAIL")
}

  
