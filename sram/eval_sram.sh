cd cacti
for cfg in ../configs/*.cfg
do
./cacti -infile $cfg
done
