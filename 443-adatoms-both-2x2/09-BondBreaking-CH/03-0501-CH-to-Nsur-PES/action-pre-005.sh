sed -i'' -e 's/STEP_START_VAL/!STEP_START_VAL/g' -e 's/TARGET/TARGET [angstrom] 2.70 !/g' TEST-1.restart
sed -i'' '/&COLVAR_RESTART/,/&END COLVAR_RESTART/d' TEST-1.restart
cp TEST-1.restart start.inp-005

