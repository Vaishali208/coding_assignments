

library(tidyverse)

args <- commandArgs(trailingOnly = TRUE)
file_list <- read_tsv(args[1], col_names = FALSE, show_col_types = FALSE) %>%
  pull(1)

joined_data <- file_list %>%
  map(~ {
    
    data <- read_tsv(.x, col_names = FALSE, show_col_types = FALSE)
    
    if (ncol(data) == 3) {
      set_names(data, c("V1", "V2", "V3"))
    } else if (ncol(data) == 2) {
      set_names(data, c("V1", "V2"))
    } else {
      stop("Unexpected number of columns in file")
    }
  }) %>%
  reduce(inner_join, by = "V1")  

write_tsv(joined_data, stdout())

