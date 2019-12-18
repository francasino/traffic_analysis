#!/bin/bash

# spinner stuff
sp="/-\|"
sc=0
spin() {
  printf "\b${sp:sc++:1}"
  ((sc==${#sp})) && sc=0
}
endspin() {
  printf "\b Done!\n"
}

cd $1

cd comp


# compute statistics for each compressed file
echo -ne "Computing statistics of compressed files... "
for comp_file in *.zip* *.rar* *.gz* *.bz2*
do
  spin
  entropy_test=$(ent "$comp_file")
  fips_test=$(fran.py "$comp_file")
  echo "$comp_file,$entropy_test,1,$fips_test" >> results_tests_comp_$1_$2.csv
done
endspin

# Check if result files exist to create the corresponding headers
if [ ! -f results_comp_$1_$2.csv ]; then
  echo "FILENAME, BYTES, ENTROPY, CHI ABS VALUE, CHI % CONFIDENCE, AVERAGE TEST, MONTECARLO, CORRELATION TEST, IGNORE, FIPS FAILED" > results_comp_$1_$2.csv
fi

grep ",$2," results_tests_comp_$1_$2.csv >> results_comp_$1_$2.csv
cp results_comp_$1_$2.csv ..
rm results_tests_comp_$1_$2.csv
rm results_comp_$1_$2.csv


#clean up
#for erase in *.gz* *.zip* *.rar* *.bz2* *.enc* rsa_key* *-rsa
#do
#    rm -Rf $erase
#done

cd ..
cd enc/

# compute statistics for each encrypted file
echo -ne "Computing statistics of encrypted files... "
for enc_file in *.enc*
do
  spin
  entropy_test=$(ent "$enc_file")
  fips_test=$(fran.py "$enc_file")
  echo "$enc_file,$entropy_test,1,$fips_test" >> results_tests_enc_$1_$2.csv
done
endspin

if [ ! -f results_enc_$1_$2.csv ]; then
 echo "FILENAME, BYTES, ENTROPY, CHI ABS VALUE, CHI % CONFIDENCE, AVERAGE TEST, MONTECARLO, CORRELATION TEST, IGNORE, FIPS FAILED" > results_enc_$1_$2.csv
fi

grep ",$2," results_tests_enc_$1_$2.csv >> results_enc_$1_$2.csv
cp results_enc_$1_$2.csv ..
rm results_enc_$1_$2.csv 
rm results_tests_enc_$1_$2.csv

#clean up
#for erase in *.gz* *.zip* *.rar* *.bz2* *.enc* rsa_key* *-rsa
#do
#    rm -Rf $erase
#done
