This folder contains a set of scripts to create a DB. 

Based on the information of the article and having enough samples of each type, we will follow the instructions to execute scripts that will:

-1. create the encripted and compressed versions of these files
-2. create the different file sizes, spliting the files created in step 1.
-3. clean the DB. 


Note that some information is hardcoded, so you will need to edit and check them to ensure that the work properly. Please follow the instructions below:


# INSTRUCTIONS

## STEP 1

>1 make a backup of the original db files, since there may be undesired deletions
 
>2 create a set of folders as in "bin" "mp3" "pdf" "txt" "img" "video" and store data. Names of files should not have white space.

>3 in script_main_create_files.sh set only the value of the max file size(now this is irrelevant). Later we will create the other DBs


>4 copy the scripts to the root:

-script_main_create_files.sh
-script_create_files.sh
-eraser.sh


Execute them. Now we have the all the files in folders separated by type and (enc and comp). 

## STEP 2


This will clean the files in the DB, selecting only a predefined amount. This will conform the final dataset. 

A part from a specific number of files, this will also select the sizes for the splits. 

Copy the scripts:

-script_main_clean_database ( edit the length, hardcoded)
-split_and_delete (edit the length and the number of files, hardcoded)


Execute the main_clean script. 

END

for the subsequent DBs of lower size, just use again clean and split and delete, repeat STEP 2  editing the scripts.

