set term pdf
set out 'ouch.pdf'
set autoscale
unset log
unset label
set xlabel "link bandwidth (Mbps)" font "Helvetica,10"
set ylabel "OUCH % improvement in map runtime over LAM" font "Helvetica,6"
set grid

set yrange[-20:20]
set ytics font "Helvetica,10"
set xrange[5:25]
set xtics font "Helvetica,10"
set key right top
set key font ",8" spacing 1.5

set bmargin 5

set style line 1 lt 1 lw 3.0 pt 7 ps 0.8 lc rgb 'red'
set style line 2 lt 2 lw 3.0 pt 4 ps 0.8 lc rgb 'blue'
set style line 3 lt 1 lw 2.8 pt 1 ps 0.5 lc rgb 'green'
set style line 4 lt 1 lw 2.8 pt 2 ps 0.5 lc rgb 'brown'
set style line 5 lt 1 lw 2.8 pt 3 ps 0.5 lc rgb 'black'

plot "ouch.txt" using 1:2 title ' vanilla OUCH' with linespoints ls 1, \
     "ouch.txt" using 1:3 title 'OUCH with task queue size awareness (est)' with linespoints ls 2
set out
