#!/bin/bash
 

#set the private key algorithms
ciphers=( "aes-128-cbc" "aes-192-cbc" "aes-256-cbc" "camellia-128-cbc" "camellia-192-cbc" "camellia-256-cbc" )

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


# create the dataset
echo -ne "creating the dataset... "
for file in *
do
  # create the compressed files
  # zip rar gz bz2
  spin
  zip -q comp_$file.zip $file
  bzip2 -c $file > comp_$file.bz2
  rar a comp_$file.rar $file -inul
  gzip -c $file > comp_$file.gz

  #create the encrypted file for each cipher
  for c in ${ciphers[@]}
  do
    openssl $c -a -salt -in $file -pass pass:`cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1` | base64 --decode > encrypted_$file.enc-$c
  done
done
endspin

