#!/bin/bash

echo "running randomness checker with $1 files in splits of $2 bytes" 
echo "tested lengths 65536, 32768, 16384, 8192, 4096, 2048"
echo "tested files mp3, txt, pdf, img, video and bin (for exec and bin files). Used to specify folder name." 

#set the filetypes
filetypes=( "bin" "mp3" "pdf" "txt" "img" "video")  # "bin" "mp3" "pdf" "txt" "img" "video" 

#set the lengths
lenghts=( "2048") # 65536, 131072, 262144, 524288, 1048576, 

#call test script for each combination
  for ft in ${filetypes[@]}
  do
	for lth in ${lenghts[@]}
  	do
         
        ./script_exps_new.sh $ft $lth
        
	done
  #./eraser.sh $ft
  done
         
