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
library("viridis")
library(knitr)
library(kableExtra)
#### Test data ####

# Read in the cleaned data
data <- read.csv("outputs/data/analysis_data.csv", check.names = F)

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



# Create scatter plot
ggplot(quantitative_data, aes (x = engagement_prop, y=sentiment_average)) + 
  geom_point(aes(color = engagement_prop)) +
  geom_smooth(method="loess", se=TRUE, color='black') +
  scale_color_viridis(option = "D")+
  theme_minimal() +
  labs(title="Test plot", x="Engagement", y="Sentiment")



# Histograms
ggplot(quantitative_data, aes(x = sentiment_average, fill = ..x..)) +
  geom_histogram(color = "black", bins = 20) +
  scale_fill_viridis(option = "D", name = "Sentiment") +
  labs(title = "Histogram of Sentiment", x = "Average Value", y = "Frequency")


# Histograms
ggplot(quantitative_data, aes(x = engagement_prop, fill = ..x..)) +
  geom_histogram(color = "black", bins = 20) +
  scale_fill_viridis(option = "D", name = "Engagement") +
  labs(title = "Histogram of Engagement", x = "Average Value", y = "Frequency")



# Summary statistics for sentiment_average
summary_sentiment <- describe(quantitative_data$sentiment_average)

# Summary statistics for engagement_prop
summary_engagement <- describe(quantitative_data$engagement_prop)

sentiment_summary <- data.frame(
  Variable = "sentiment_average",
  n = summary_sentiment$n,
  Mean = summary_sentiment$mean,
  SD = summary_sentiment$sd,
  Median = summary_sentiment$median,
  Min = summary_sentiment$min,
  Max = summary_sentiment$max,
  Skew = summary_sentiment$skew,
  Kurtosis = summary_sentiment$kurtosis
)

engagement_summary <- data.frame(
  Variable = "sentiment_average",
  n = summary_engagement$n,
  Mean = summary_engagement$mean,
  SD = summary_engagement$sd,
  Median = summary_engagement$median,
  Min = summary_engagement$min,
  Max = summary_engagement$max,
  Skew = summary_engagement$skew,
  Kurtosis = summary_engagement$kurtosis
)

print(sentiment_summary)






