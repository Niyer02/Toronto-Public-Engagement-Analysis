# Toronto Public Engagement Analysis

## Overview
**Statement on LLM usage: No aspects of the code or paper were written with the help of an LLM**

This paper analyzes and discusses the results that were formed from survey data collected by the city of Toronto (“City of Toronto Open Data” 2009). The paper discusses the correlation and effect of Toronto residents' engagement, and their perception of the city. The analysis was performed in `R`(R Core Team 2021), using tidyverse(Wickham et al. 2019),
tibble(Müller and Wickham 2023), dplyr(Wickham et al. 2023), ggplot2(Wickham 2016),
viridis(Garnier et al. 2023), knitr(Xie 2023), and KableExtra(Zhu et al. 2024).

## File Structure

The repo is structured as:

-   `main/Toronto-Public-Engagement-Analysis/inputs/data` contains the raw data.
-   `main/Toronto-Public-Engagement-Analysis/outputs/data` contains the cleaned dataset that was constructed.
-   `main/Toronto-Public-Engagement-Analysis/outputs/paper` contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the paper. 
-   `scripts` contains the R scripts used to simulate, download and clean data.
