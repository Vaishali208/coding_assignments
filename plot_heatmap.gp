#!/usr/bin/env gnuplot
#set up terminal and output file
set terminal postscript size 6,6 font 'Arial, 15'
set output "big_matrix.eps"

# Load data as a matrix
set datafile separator '\t'
set datafile missing "NA"
set view map
set size ratio -1
set palette defined (0 "blue", 0.5 "white", 1 "red")
unset key

# Define axis labels
set xlabel "Columns"
set ylabel "Rows"

# Adjust margins for better visualization
set lmargin 10
set rmargin 10
set tmargin 5
set bmargin 5

# Set color range for heatmap
set cbrange [0:1]  # Adjust according to your data scale

# Plot the data as a heatmap
splot 'demo_data.tsv' using 1:2:3 with pm3d notitle

# Draw horizontal lines to separate clusters
# Adjust y-values as needed based on the data structure
set arrow from 0, 0.3 to 1, 0.3 nohead lc rgb "black" lw 2
set arrow from 0, 0.6 to 1, 0.6 nohead lc rgb "black" lw 2

# Replot to refresh arrows
replot

# Exit the gnuplot session
quit

