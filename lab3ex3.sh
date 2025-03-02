#! /bin/bash

# Checks for existance of check4me.txt

if [ -f "check4me.txt" ]
then
	echo "check4me.txt exists and is a regular file"
else
	echo "$0: check4me.txt does not exist or is not a regular file" 1>&2
fi
