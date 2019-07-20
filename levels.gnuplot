# set terminal pngcairo  transparent enhanced font "arial,10" fontscale 1.0 size 500, 350 
set terminal postscript eps color enhanced size 3.0, 1.7
set output 'levels.eps'

set style line  1 lw 0.500 lt 0 lc rgb "black" pt 7 ps 1.0
set style line  2 lw 2.000 lt 1 lc rgb "black" pt 7 ps 1.0
set style line  3 lw 2.000 lt 1 lc rgb "blue" pt 7 ps 1.0
set style line  4 lw 2.000 lt 1 lc rgb "green" pt 7 ps 1.0
set style line  5 lw 2.000 lt 1 lc rgb "cyan" pt 7 ps 1.0
set style line  6 lw 2.000 lt 1 lc rgb "magenta" pt 7 ps 1.0
set style line  7 lw 3.000 lt 2 lc rgb "black" pt 7 ps 0.0
set style line  8 lw 2.000 lt 2 lc rgb "grey" pt 7 ps 0.0
set style line  9 lw 2.000 lt 0 lc rgb "grey" pt 7 ps 0.0
set style increment user 

#xabc=-0.20
set xlabel "Reaction coordinate"
#set yrange [0:400]
set xrange [-0.2:*]
#set xtics (128,256,512,1024,2048,4096,8192,16384,32768)
set style data l
#set lmargin 9
unset key
#set key at graph 0.95, 0.95
unset border 
set border 2
unset xtics
set ytics nomirror

#set multiplot

#set size 1.0, 0.3333
#set origin 0.0, 0.6667
##unset logscale y
set ylabel "Energy (kJ mol^{-1})"
#set format x "%2.0t{/Symbol \327}10^{%L}"
#set format y "%2.0t{/Symbol \327}10^{%L}"
#set xtics 1000 
#set mxtics 2 
#set ytics 100 
#set mytics 2 
#set format x ""
#unset xlabel
#set ytics 4.0 
#set format y "%5.1f"
#unset label
#set label "a" at graph xabc, 1 font "Helvetica-Bold"
#set cbrange [0:1]
p 'plot.dat', 'plot.dat2'

#p 'time.F-TZV.00' u 1:($3+4*$4+5*$5) title 'OT 1 m.p.c.', 'time.G-TZV.05' u 1:($3+(10-$7)*$8-$4) title '8 m.p.c.', 'time.G-TZV.06' u 1:($3+(10-$7)*$8-$4) title '4 m.p.c.', 'time.G-TZV.07' u 1:($3+(10-$7)*$8-$4) title '2 m.p.c.', 'time.G-TZV.00' u 1:($3+(10-$7)*$8-$4) title '1 m.p.c.', 'limit.dat' w l lt 7 notitle, 'time.G-TZV.p00128'  u 1:($3+(10-$7)*$8-$4) w l lt 8 notitle, 'time.G-TZV.p00256' u 1:($3+(10-$7)*$8-$4) w l lt 8 notitle, 'time.G-TZV.p00512' u 1:($3+(10-$7)*$8-$4) w l lt 8 notitle, 'time.G-TZV.p01024' u 1:($3+(10-$7)*$8-$4) w l lt 8 notitle
#unset multiplot
##pause -1 "Hit any key to continue"
