set term pdf
set out 'map-time.pdf'
set autoscale
unset log
unset label
set xlabel "link bandwidth (Mbps)" font "Helvetica,10"
set ylabel "median map task runtime at remote worker (secs)" font "Helvetica,6"
set grid

set yrange[20:120]
set ytics font "Helvetica,10"
set xrange[5:30]
set xtics font "Helvetica,10"
set key right top
set key font ",10" spacing 1.5
plot "mapTime.txt" using 1:2 title 'WAN cluster' with linespoints linewidth 3
set out
