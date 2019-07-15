NR==atom1 {x1=$2; y1=$3; z1=$4};
NR==atom2 {x2=$2; y2=$3; z2=$4};

END {
  dist=sqrt((x1-x2)**2+(y1-y2)**2+(z1-z2)**2)
  printf("%10.6f\n",dist)
}

