
# Script for storing data file paths and imports common to all other scripts

# loading the data


# name of the first file
data_file_name <- "tidy_results.xlsx"

# file path
data_directory_file_path <- file.path(".","data")

# loading data of the first file
data_file <- read_excel(path = file.path(data_directory_file_path, data_file_name), sheet = "Sheet14", na="NA", col_names=FALSE)

