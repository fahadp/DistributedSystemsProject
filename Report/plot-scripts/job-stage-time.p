set term pdf
set out 'stage-time-localMap.pdf'
set autoscale
unset log
unset label
set xlabel "link bandwidth (Mbps)" font "Helvetica,10"
set ylabel "runtime (secs)" font "Helvetica,10"
set grid

set yrange[0:300]
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

plot "jobTime.txt" using 1:3 title 'MR map stage' with linespoints ls 1, \
     "jobTime.txt" using 1:4 title 'MR reduce stage' with linespoints ls 2, \
     "jobTime.txt" using 1:7 title 'MR with LAM map stage' with linespoints ls 3, \
     "jobTime.txt" using 1:8 title 'MR with LAM reduce stage' with linespoints ls 4
set out
