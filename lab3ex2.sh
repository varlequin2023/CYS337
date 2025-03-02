#! /bin/bash

# This script will take a user's favorite color as a parameter

# Checks if we have one parameter from command line
if [ $# -eq 1 ]
then
	echo "Your favorite color is "$1
else
	echo "$0: Incorrect number of parameters, one is expected" 1>&2
fi
