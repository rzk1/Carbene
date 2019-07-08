sed -i'' -e 's/STEP_START_VAL/!STEP_START_VAL/g' -e 's/TARGET/TARGET [angstrom] 1.50 !/g' TEST-1.restart
sed -i'' '/&COLVAR_RESTART/,/&END COLVAR_RESTART/d' TEST-1.restart
cp TEST-1.restart start.inp-003
tail -n 8 TEST-pos-1.xyz > initial-snapshot-003.xyz

