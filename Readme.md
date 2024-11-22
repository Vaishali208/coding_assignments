Q1: Selecting lines from stdin (Python Code + Linux Command)

Explanation : -The task is to match the gene IDs from the query file to the corresponding entries in the big data file and return the entire line where a match is found. The code should not assume that the pattern is in a specific column.

Explanation of the Python Code:
Load the Patterns: The function load_patterns() reads the query file and stores each line in a set.
Print the Patterns: The script prints the patterns to stdout, which will be useful for piping into Linux commands.

Explanation of the Linux Command:
Extract Patterns: The Python script reads data/to_select.tsv and writes the patterns to patterns.txt.
Filter the Data:
zcat decompresses the .gz file and pipes the output to grep.
grep -F -f patterns.txt filters lines that contain any of the patterns listed in patterns.txt.

Command I used to run - python select_lines.py /home/bec51320.iitr/~workplace/data/to_select.tsv > patterns.txt
Output file - patterns.txt

Tools I used -Linux -zcat, awk, grep

Q2: Plotting a group of lines ( R + Linux Command)

Explanation of the R Script : -
Reading Data : The script reads data from stdin using the fread() function from the data.table package for efficient data handling.
Plotting: Uses ggplot2 to plot Position vs. Enrichment with lines colored by Category.
Customizes labels, title, and appearance using the labs() and theme() functions.
Saving the Plot: The plot is saved using ggsave() to the specified output file.
  
Command to run the script - cat /home/bec51320.iitr/~workplace/bec-513-coding-questions/data/q2_data.tsv | Rscript plot_lines.R -o "different_clusters.png" -x "Relative from center [bp]" -y "Enrichment over Mean" -t "MNase fragment profile"

Tools I used -
ggplot2: For creating the line plot.
optparse: For handling command-line arguments in R. 

Q3:Merge multiple files (R + Linux Command) 

Explanation of the R script : -
 Reads a list of file paths from file list_q3.tsv , processes each file by reading its content, renames columns depending on the number of columns in each file , joins all files based on a common column(the first column, v1), outputs the final joined data to the terminal (standard output).

Command to run the script - Rscript join_list_of files.R home/bec51320.iitr/~workplace/bec-513-coding-questions/data/list_q3.tsv > home/bec51320.iitr/~workplace/bec-513-coding-questions/data/join_output.tsv

Tools I used - 
Tidyverse : tool that do cleaning, transforming, visualizing, and modeling data.

Q4: Label with quantiles (Python)

Explanation of the code : -
Reading Input:The list of numbers is read from stdin and stored in a list.
We convert the input to floats and filter out any non-numeric lines.
Using qcut():The qcut() function is used to divide the data into the specified number of quantiles.
The labels parameter assigns labels like q1, q2, etc., for each quantile.
The retbins=True option returns the bins used to define the quantiles.
Output:For each number, the script outputs the value, the quantile it belongs to, and the quantile range.

Command to run the script -  cat /home/bec51320.iitr/~workplace/bec-513-coding-questions/data/first_hundred_numbers.tsv | python group_in_quantiles.py 4

Q5: Plotting big matrix (Linux + Gnuplot)

Explanation of Gnuplot script : - 
Postscript - for efficient plotting
matrix option - Gnuplot treats the data as a grid
set Palette - defines the colour schemes
cbrange - colour range
output - big_matrix. eps 

converting eps to pdf - ps2pdf big_matrix.eps big_matrix.pdf

Command to run the script - gnuplot plot_heatmap.gp

