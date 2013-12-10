set term pdf
set out 'baws.pdf'
unset log
unset label
set xlabel "link bandwidth (Mbps)" font "Helvetica,10"
set ylabel "% decrease in runtime over LAM" font "Helvetica,8"
set y2label "% decrease in runtime overall" font "Helvetica,8"
set grid

set xrange[5:25]
set xtics font "Helvetica,8"
set yrange[-5:15] 
set ytics nomirror font "Helvetica,8" tc ls 1
set y2range[50:70] 
set y2tics nomirror font "Helvetica,8" tc ls 2
set key center top font ",8"

set bmargin 5

set style line 1 lt 1 lw 3.0 pt 7 ps 0.8 lc rgb 'red'
set style line 2 lt 2 lw 3.0 pt 4 ps 0.8 lc rgb 'blue'
set style line 3 lt 1 lw 2.8 pt 1 ps 0.5 lc rgb 'green'
set style line 4 lt 1 lw 2.8 pt 2 ps 0.5 lc rgb 'brown'
set style line 5 lt 1 lw 2.8 pt 3 ps 0.5 lc rgb 'black'

plot "ouch1.txt" using 1:2 axes x1y1 title 'BAWS improvement over LAM' with linespoints ls 1, \
     "ouch1.txt" using 1:3 axes x1y2 title 'BAWS improvement over Spark' with linespoints ls 2

set out
