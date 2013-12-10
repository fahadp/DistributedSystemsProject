set term pdf
set out 'reduce-blocks.pdf'
set autoscale
unset log
unset label
set xlabel "link bandwidth (Mbps)" font "Helvetica,10"
set ylabel "median # remote blocks fetched in reduce" font "Helvetica,8"
set grid

set yrange[10:30]
set ytics font "Helvetica,10"
set xrange[5:30]
set xtics font "Helvetica,10"
set key right top
set key font ",10" spacing 1.5
plot "reduceTime.txt" using 1:2 title 'node 1' with linespoints linewidth 3, \
     "reduceTime.txt" using 1:3 title 'node 2' with linespoints linewidth 3
set out
