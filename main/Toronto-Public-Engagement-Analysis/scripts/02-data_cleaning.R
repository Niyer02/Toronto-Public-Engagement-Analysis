#### Preamble ####
# Purpose: Cleans the recorded survey data
# Author: Nikhil Iyer
# Date: 23 January 2024
# Contact: nik.iyer@mail.utoronto.ca
# License: MIT
# Pre-requisites: None

#### Workspace setup ####
library(tidyverse)
library(tibble)

#### Clean data ####
raw_read_data <- read.csv("inputs/data/survey_data.csv", check.names = FALSE)
cleaned_data <- raw_read_data

# Replace all NA values with 0 and all empty cells with 'NA'
cleaned_data[is.na(cleaned_data)] <- 0
cleaned_data[cleaned_data == ""] <- NA

# Only keep variables of interest
features <- c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,
              33,34,35,36,37,38,39,40,41,42,
              84,85,86,87,88,89,90,91,92,93)

parsed_data <-cleaned_data[, features]

# Remove all rows where the predicted features are entirely NA
final_data <- parsed_data[!(is.na(parsed_data[, 22]) & is.na(parsed_data[, 23]) 
                     & is.na(parsed_data[, 24]) & is.na(parsed_data[, 25])
                     & is.na(parsed_data[, 26]) & is.na(parsed_data[, 27])
                     & is.na(parsed_data[, 28]) & is.na(parsed_data[, 29])
                     & is.na(parsed_data[, 30]) & is.na(parsed_data[, 31])
                     & is.na(parsed_data[, 32]) & is.na(parsed_data[, 33])
                     & is.na(parsed_data[, 34]) & is.na(parsed_data[, 35])
                     & is.na(parsed_data[, 36]) & is.na(parsed_data[, 37])
                     & is.na(parsed_data[, 38]) & is.na(parsed_data[, 39])
                     & is.na(parsed_data[, 40]) & is.na(parsed_data[, 41])), ]

#### Save data ####
write_csv(cleaned_data, "outputs/data/analysis_data.csv")
