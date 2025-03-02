#! /bin/bash

# First Parameter is the path to check, second is output file

# Temporary file to hold ls and sha1sum output
tfile="temp01.txt"

if [ $# -eq 2 ]
then
	# Remove the current output file to erase old information, ignore if it does not exist
	rm -f "$tfile"

	# Loop through all files that are in the path (first parameter)
	for i in "$1"/*
	do
		if [ -f "$i" -a -r "$i" ]	# File must be regular and readable
		then
			# Append this file's information to the temporary file
			echo `ls -l "$i"` `sha1sum "$i"` >> "$tfile"
		fi
	done

	# If creating baseline, tempfile is baseline, else check for diffs
	if [ "$2" = "baseline.txt" ]
	then
		mv "$tfile" "$2"
	else
		diff baseline.txt "$tfile" | grep "^\(<\|>\)" | awk '{ print $NF }' | uniq > "$2"
		rm "$tfile"
	fi
else
	# Error message to standard error
	echo "$0: 2 parameters expected: path and output filename" 1>&2
fi
