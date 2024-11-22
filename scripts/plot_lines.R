
library(ggplot2)
library(data.table)
library(optparse)

option_list <- list(
  make_option(c("-o", "--output"), type = "character", default = "plot.png",
              help = "Output file name [default: %default]", metavar = "character"),
  make_option(c("-x", "--xlabel"), type = "character", default = "X-axis",
              help = "Label for X-axis", metavar = "character"),
  make_option(c("-y", "--ylabel"), type = "character", default = "Y-axis",
              help = "Label for Y-axis", metavar = "character"),
  make_option(c("-t", "--title"), type = "character", default = "Line Plot",
              help = "Title of the plot", metavar = "character")
)

opt_parser <- OptionParser(option_list = option_list)
opt <- parse_args(opt_parser)

input_data <- read.table(file("stdin"), sep = "\t", header = TRUE)

if (!all(c("Position", "Enrichment", "Category") %in% colnames(input_data))) {
  stop("Input data must have 'Position', 'Enrichment', and 'Category' columns.")
}

p <- ggplot(input_data, aes(x = Position, y = Enrichment, color = Category, group = Category)) +
  geom_line(size = 1.2) +
  labs(x = opt$xlabel, y = opt$ylabel, title = opt$title, color = "Category") +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5, size = 16),
    axis.title.x = element_text(size = 12),
    axis.title.y = element_text(size = 12),
    legend.title = element_text(size = 12),
    legend.text = element_text(size = 10)
  )

ggsave(filename = opt$output, plot = p, width = 8, height = 6, dpi = 300)

cat("Plot saved to", opt$output, "\n")

