#!/bin/bash


echo "clean database" 


#set the filetypes
filetypes=( "bin" "mp3" "pdf" "txt" "img" "video" )  # "bin" "mp3" "pdf" "txt" "img" "video" 

#set the lengths
lenghts=( "524288" ) # # 65536, 131072, 262144, 524288, 1048576,.. "65536" "32768" "16384" "8192" "4096" "2048" 

#call test script for each combination
  for ft in ${filetypes[@]}
  do
        for lth in ${lenghts[@]}
  	do
  		./split_and_delete_step3.sh $ft $lth 
	done

  done
