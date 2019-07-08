currentDir=`pwd`
projName='TEST'
cp2kInp='start'
action=1 # 1-submit, 2-analyze
atom1=127
atom2=211

intI=0

for idist in `seq 3.40 -0.2 0.80`
do

 dist=`printf "%04.2f" $idist`
 jobID=$dist
 intI=$((intI+1))
 strI=`printf "%03d" $intI`
 echo $dist $strI

 if [ $action == 1 ]
 then

  if [ "$intI" -eq "1" ]; then
   sed -e "s/_PR1_/$projName/g" -e "s/_A1_/$atom1/g" -e "s/_A2_/$atom2/g" -e "s/_D1_/$dist/g" $cp2kInp.templ > $cp2kInp.inp
  else
   sed -e "s/_PR1_/$projName/g" -e "s/_I1_/$strI/g" -e "s/_D1_/$dist/g" delayed-action.templ > delayed-action-$strI.sh
  fi

 elif [ $action == 2 ]
 then

  dist=`tail -n 156 $jobID/TEST-pos-1.xyz | awk -v atom1="$atom1" -v atom2="$atom2" -f analysis.awk`
  energy=`grep 'ENERGY|' $jobID/start.out-001 | tail -n 1 | awk '{print $9}'`
  echo $dist $energy
  tail -n 158 $jobID/$projName-pos-1.xyz >> $currentDir/profile.xyz

 fi

done

submit_cp2k.pl -1 80 40 -1 -1 12 00 $projName $cp2kInp.inp $cp2kInp.out $strI 0

