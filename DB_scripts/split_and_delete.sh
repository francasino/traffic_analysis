#!/bin/bash
 



cd $1


#do splitting


cd enc/


for file in *.enc*
do

	split $file -b $2 -d $file

done
# size was between +65k and -63k for hedge initial


find . -name "*.*" -size +1025k -delete
find . -name "*.*" -size -1023k -delete

# tail was of 1001, but now we have less files.
find -type f -print0 | sort -zR | tail -zn +101 | xargs -0 rm -rf

cd ..
cd comp/

for file in *.zip* *.rar* *.gz* *.bz2*
do

	split $file -b $2 -d $file

done

find . -name "*.*" -size +1025k -delete
find . -name "*.*" -size -1023k -delete

find -type f -print0 | sort -zR | tail -zn +101 | xargs -0 rm -rf


