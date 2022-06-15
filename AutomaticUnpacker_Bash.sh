#!/bin/bash

extract()
{
case $unpack in
*.tgz)
tar xzf
;;
*.tar.gz)
tar xzf
;;
*.bzip)
bunzip
;;
*.zip)
unzip
;;
*.rar)
rar x
;;
*.tar)
tar xf
;;
*.7z)
7z x
;;
*.Z)
uncompress
;;
*.tgz)
tar xzf
;;
*.tbz2)
tar xjf
;;
*.gz)
gunzip
;;
*.bz2)
bunzip2
;;
*.tar.bz2)
tar xjf
;;
*)
echo "$unpack could not be extracted! Unknown file format."
esac
}

for $unpack in $@
do
extract || exit 1
done
