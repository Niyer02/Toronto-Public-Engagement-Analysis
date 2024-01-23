#### Preamble ####
# Purpose: Downloads and saves the data from the opendatatoronto website
# Author: Nikhil Iyer
# Date: 23 January 2024
# Contact: nik.iyer@mail.utoronto.ca
# License: MIT
# Pre-requisites: Internet access


#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)
library(tibble)

#### Download data ####
# Read in the raw data via URL
url <- "https://ckan0.cf.opendata.inter.prod-toronto.ca/dataset/67729376-d03d-4e2d-a517-7bcf42879e31/resource/56eb2716-3d06-42f8-8718-e7fb283a52ec/download/PER%20Public%20Survey%20Results%20CSV.csv"

# File name and location where you want to save the file
file_name <- "survey_data.csv"
file_path <- "inputs/data/"

#### Save data ####
download.file(url, paste(file_path, file_name, sep = ""), mode = "wb")

# Read into data frame to test
readfile <- read.csv("inputs/data/survey_data.csv", check.names = F)

         
