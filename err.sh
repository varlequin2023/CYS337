#! /bin/bash

# Check if we have a single parameter from the command line

echo "This is Vincent's error handling script"

if [ $# -eq 1 ]
then
	echo "There is one argument"
else
	echo "$0: Incorrect number of arguments, one is expected" 1>&2
fi
