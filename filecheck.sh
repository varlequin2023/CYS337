#! /bin/bash

# first parameter is the file to check for differences from baseline.txt
# second parameter is the name of the output file

# a temporary file to hold files' information
tempfile="temp01.txt"

if [ $# -eq 2 ]
then
	# output the file's information to the temporary file
	echo `ls -l "$1"` `sha1sum "$1"` > "$tempfile"
	
	# check for differences from baseline, output only filename
	diff baseline.txt "$tempfile" | grep "^\(<\|>\)" | awk '{ print $NF }' | uniq > "$2"
	rm "$tempfile"
else
	# error message to standard error
	echo "$0: 2 parameters expected: filename and output filename" 1>&2
fi
