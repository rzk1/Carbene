currentDir=`pwd`
action=2 # 1-submit, 2-analyze
atom1=32
atom2=148

#cp start-first.xyz start-next.xyz
if [ -e $currentDir/profile.xyz ]
then
 rm $currentDir/profile.xyz
fi

for ipsi in `seq 3.04 -0.2 0.84`
do
 psi=`printf "%04.2f" $ipsi`

 jobID=$psi

 if [ $action == 1 ]
 then

  mkdir $jobID

  sed -e "s/_D1_/$psi/g" start.templ > $jobID/start.inp
  cd $jobID
  submit_cp2k.pl -1 80 40 -1 -1 12 00 $jobID start.inp start.out 1 0

  # restart the next psi job from the optimized geometry
  #tail -n 158 TEST-pos-1.xyz > $currentDir/start-next.xyz

  cd $currentDir

 elif [ $action == 2 ]
 then

  dist=`tail -n 156 $jobID/TEST-pos-1.xyz | awk -v atom1="$atom1" -v atom2="$atom2" -f analysis.awk`
  energy=`grep 'ENERGY|' $jobID/start.out-001 | tail -n 1 | awk '{print $9}'`
  echo $dist $energy
  tail -n 158 $jobID/TEST-pos-1.xyz >> $currentDir/profile.xyz

 fi

done

#rm start-next.xyz
