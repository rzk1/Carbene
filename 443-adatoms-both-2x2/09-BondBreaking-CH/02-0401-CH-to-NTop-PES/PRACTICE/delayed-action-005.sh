sed -i'' -e 's/STEP_START_VAL/!STEP_START_VAL/g' -e 's/TARGET/TARGET [angstrom] 1.10 !/g' TEST-1.restart
cp TEST-1.restart start.inp-005
tail -n 8 TEST-pos-1.xyz > initial-snapshot-005.xyz

