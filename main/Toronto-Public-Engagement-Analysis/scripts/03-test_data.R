#### Preamble ####
# Purpose: Tests assumptions and generates statistics on the dataset 
#          for further inferance
# Author: Nikhil Iyer
# Date: 23 January 2024
# Contact: nik.iyer@mail.utoronto.ca
# License: MIT
# Pre-requisites: Dependencies installed


#### Workspace setup ####
library(tidyverse)
library(dplyr)
library(ggplot2)
library(psych)
library(viridis)
library(knitr)
library(kableExtra)
#### Test data ####

# Read in the cleaned data
data <- read.csv("/cloud/project/main/Toronto-Public-Engagement-Analysis/outputs/data/analysis_data.csv", check.names = F)

# Sum the rows of the int columns which are engagement
data$engagement_sum <- rowSums(data[, 2:21])

# Add mean of responses
data$engagement_prop <- rowMeans(data[, 2:21])

# Convert the qualitative features to numeric for analysis

# Strongly Disagree -> -2
# Disagree -> -1
# Neither agree nor disagree -> 0
# Agree -> 1
# Strongly Agree ->2
qualitative_mapping <- function(i) {
  i <- tolower(i) # Convert to lowercase
  ifelse(i == "strongly disagree", -2,
         ifelse(i == "disagree", -1,
                ifelse(i == "neither agree nor disagree", 0,
                       ifelse(i == "agree", 1,
                              ifelse(i == "strongly agree", 2, NA)))))}
# Apply mapping function
quantitative_data <- data %>% mutate_at(vars(22:41), ~qualitative_mapping(.))

# calculate the mean of the sentiment
quantitative_data <- quantitative_data %>% mutate(sentiment_average = rowMeans(select(., 22:41), na.rm = TRUE))

#### Data Tests ####
numeric <- sapply(data[c("engagement_sum", "engagement_prop")], is.numeric)

# Print the result
if (all(numeric)) {
  print("PASS.")
} else {
  print("FAIL.")
}







