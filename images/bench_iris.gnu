APP = "bench_iris"
OUTPUT_FILE = APP . '.eps'
INPUT_FILE = APP . '.dat'

set terminal postscript enhanced color solid size 10,6.0
set output OUTPUT_FILE
set key horizontal outside center bottom
unset border
set border 15 lw 3 # (1=bottom, 2=left,  4=top,  8=right)

set xtics font ", 16"
set ytics font ", 16"
set ylabel font ",16"
set key font ",16"

set grid ytics

set bmargin -6

set bars fullwidth
set boxwidth 0.9 absolute
set style fill solid 1.0 border -1

set ylabel "Execution time (ms)" #offset -4

set yrange[0:8.2]
set xtics ("1" 0, "2" 1, "3" 2, "4" 3, "5" 4, "6" 5, "7" 6, "8" 7, "9" 8, "10" 9, "11" 10, "12" 11)
#set style histogram errorbars gap 1 lw 1
set style data histogram
set grid ytics lt 0 lw 1

plot INPUT_FILE u 2 t "OpenCL" lc rgb '#F4A460', \
"" u 3 t "OpenMP" lc rgb '#3A5FCD'

set output
