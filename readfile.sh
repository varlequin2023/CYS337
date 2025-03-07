#! /bin/bash

# read a file (first command line parameter)
# the output file has 5 fields
# output only the first and last fields of the input file

# if not 1 command line argument, then error 1
if [ $# -ne 1 ]
then
	echo "$0: One argument (filename to parse) is expected" 1>&2
	exit 1
fi

# if the file passed in is not a regular file or not readable, then error 2
if ! [ -f "$1" -a -r "$1" ]
then
	echo "$0: The file passed in is not a regular file or not readable" 1>&2
	exit 2
fi

# our input file is CSV, so change IFS to comma
IFS=,

# use the count variable to keep track of lines read
count=0

#loop until the entire file has been read
while read field1 field2 field3 field4 field5
do
	# increase the number of lines read
	count=`expr $count + 1`

	if [ $count -ne 1 ]
	then
		echo "This line's first field is $field1 and last field is $field5"
	fi
done < "$1"
