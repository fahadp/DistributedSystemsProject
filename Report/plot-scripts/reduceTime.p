set term pdf
set out 'reduce-time.pdf'
set autoscale
unset log
unset label
set xlabel "link bandwidth (Mbps)" font "Helvetica,10"
set ylabel "median remote fetch time in reduce (secs)" font "Helvetica,8"
set grid

set yrange[0:25]
set ytics font "Helvetica,10"
set xrange[5:30]
set xtics font "Helvetica,10"
set key right top
set key font ",10" spacing 1.5
plot "reduceTime.txt" using 1:4 title 'node 1' with linespoints linewidth 3, \
     "reduceTime.txt" using 1:5 title 'node 2' with linespoints linewidth 3
set out
