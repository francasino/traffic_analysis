#!/bin/bash
 


cd $1

echo "deleting files in $1 " 

mkdir enc
mkdir comp

for file in *.jpg *.mp3 *.txt *.pdf *.png *.exe *.dll *.avi *.mp4  
do
    rm -Rf $file
done

for file in *.enc*
do

cp $file enc/$file
rm $file

done

for file in *.zip* *.rar* *.gz* *.bz2*
do

cp $file comp/$file
rm $file

done
