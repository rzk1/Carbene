currentDir=`pwd`
projName='TEST'
cp2kInp='start'
action=1 # 1-submit, 2-analyze
atom1=127
atom2=211
natoms=212

intI=0
nlines=$((natoms+2))

for idist in `seq 3.40 -0.2 0.80`
do

 dist=`printf "%04.2f" $idist`
 jobID=$dist
 intI=$((intI+1))
 strI=`printf "%03d" $intI`

 if [ $action == 1 ]
 then

  echo $dist $strI
  if [ "$intI" -eq "1" ]; then
   sed -e "s/_PR1_/$projName/g" -e "s/_A1_/$atom1/g" -e "s/_A2_/$atom2/g" -e "s/_D1_/$dist/g" $cp2kInp.templ > $cp2kInp.inp
  else
   sed -e "s/_PR1_/$projName/g" -e "s/_I1_/$strI/g" -e "s/_D1_/$dist/g" action-pre.templ > action-pre-$strI.sh
  fi
  sed -e "s/_PR1_/$projName/g" -e "s/_I1_/$strI/g" -e "s/_N1_/$nlines/g" action-post.templ > action-post-$strI.sh

 elif [ $action == 2 ]
 then

  dist=`tail -n $natoms final-snapshot-$strI.xyz | awk -v atom1="$atom1" -v atom2="$atom2" -f analysis.awk`
  energyCombined=`grep 'ENERGY|' $cp2kInp.out-$strI | tail -n 1 | awk '{print $9}'`
  energyTrue=`grep 'Total energy:' $cp2kInp.out-$strI | tail -n 1 | awk '{print $3}'`
  echo $dist $energyCombined $energyTrue

 fi

done

if [ $action == 1 ]
then
 submit_cp2k.pl -1 80 40 -1 -1 12 00 $projName $cp2kInp.inp $cp2kInp.out $strI 0
fi

