NR==1 {
	e0=$1
	units=$2
	offsetX=0.5
	offsetY=-15
}

NR>1 {
	ecurr=($1-e0)*units
	printf("%10.4f\n%10.4f\n",ecurr,ecurr) > "plot.dat1"
	printf("%10.4f\n%10.4f\n\n",ecurr,ecurr) > "plot.dat2"
	printf("%4.1f%8d%8d\n",offsetX,ecurr+offsetY,ecurr) > "plot.dat3"
	offsetX+=2.0
}

