APP = "analysis"
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
set bmargin -8

set grid ytics
set yrange [0:8]

set bars fullwidth
set boxwidth 0.75 absolute
set style fill solid 1.0 border -1
set offset -0.6,-0.6,0,0

set ylabel "Execution time (ms)"

set xtics ("1 : OCL" 0, "    OMP" 1, "" 2, "2 : OCL" 3, "    OMP" 4, "" 5, "3 : OCL" 6, "    OMP" 7, "" 8, "6 : OCL" 9, "    OMP" 10, "" 11, "9 : OCL" 12,"     OMP" 13) rotate by 45 right
set style histogram rowstacked gap 2
set style data histogram

plot INPUT_FILE u 3 t "Kernel" lc rgb '#87CEEB', \
"" u 2 t "Offloading"  lc rgb '#F4A460', \
"" u ($4-($2+$3)) t "Managment" lc rgb '#9400D3'

set output

#plot INPUT_FILE u $3 t "Kernel" lc rgb '#9400D3', \
#"" u (100.*$3/$5) t "Offloading"  lc rgb '#F4A460', \
#"" u (100.*$4/$5) t "Managment" lc rgb '#87CEEB'
