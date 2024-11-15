
#ad necessary libraries
library(tidyverse)

# Specify the base directory and expand '~'
base_dir <- "/home/bec51320.iitr/~workplace/bec-513-coding-questions/data/"
base_dir <- path.expand(base_dir)  # Expand ~ to full path

# Check if the correct number of arguments is provided
args <- commandArgs(trailingOnly = TRUE)
if (length(args) != 1) {
  stop("Usage: Rscript join_list_of_files.R <file_list.tsv>")
}

# Read the list of file names from the input file
file_list <- readLines(args[1])

# Debugging: Print the list of files to verify paths
print("File List (Relative Paths):")
print(file_list)

# Resolve relative paths by combining base directory with the file paths
file_list <- file.path(base_dir, file_list)

# Expand '~' in file paths to ensure all paths are correct
file_list <- path.expand(file_list)

# Debugging: Print the absolute file paths to verify
print("File List (Absolute Paths):")
print(file_list)

# Ensure that all files exist before attempting to read them
file_exists <- file.exists(file_list)

# Debugging: Print which files do not exist
print("Files that do not exist:")
print(file_list[!file_exists])

# Filter out non-existent files
file_list <- file_list[file_exists]

# Check i

