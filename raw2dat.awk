NR==1 {
	e0=$1
	units=$2
}

NR>1 {
	ecurr=($1-e0)*units
	printf("%10.4f\n%10.4f\n",ecurr,ecurr)
}

