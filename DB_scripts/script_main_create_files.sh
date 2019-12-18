
echo "running database creator" 


#set the filetypes
filetypes=( "bin" "mp3" "pdf" "txt" "img" "video" )  # "bin" "mp3" "pdf" "txt" "img" "video" 

#set the lengths
lenghts=( "1048576" ) # the different lengths. this is 1mb

#call test script for each combination
  for ft in ${filetypes[@]}
  do
	for lth in ${lenghts[@]}
  	do
         
        ./script_create_files.sh $ft $lth

	done
  ./eraser.sh $ft
  
  done
