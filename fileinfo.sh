#! /bin/bash

# This script takes one parameter, a filename

# Verify that one parameter has been passed
if [ $# -eq 1 ]
then
	echo `ls -l "$1"` `sha1sum "$1"`
else
	echo "$0: A filename is required as a parameter" 1>&2
fi
