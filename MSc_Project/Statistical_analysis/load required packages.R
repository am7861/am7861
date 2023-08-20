
# Code for loading required packages

# Define packages to load
trade_stats_packages <- c("readr", # loading csv files
                          "readxl", # loading excel files
                          "janitor",# cleaning column names
                          "lubridate",# dealing with dates and times
                          "tidyr", # creating tidy data
                          "dplyr",
                          "ggplot2",
                          "reshape2",
                          "janitor") # data manipulation


# Load all packages at once
lapply(X = trade_stats_packages,
       FUN = library,
       character.only = TRUE)