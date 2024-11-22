
set terminal postscript size 6,6 font 'Arial, 15'
set output "big_matrix.eps"

set datafile separator '\t'
set view map
set size ratio -1
set palette defined (0 "blue", 0.5 "white", 1 "red")
unset key

set xlabel "Columns"
set ylabel "Rows"

set lmargin 10
set rmargin 10
set tmargin 5
set bmargin 5

set cbrange [0:1]  # Adjust according to your data scale

splot 'demo_data.tsv' matrix with image

set arrow from screen 0, graph 0.3 to screen 1, graph 0.3 nohead lc rgb "black" lw 2
set arrow from screen 0, graph 0.6 to screen 1, graph 0.6 nohead lc rgb "black" lw 2

replot

quit

