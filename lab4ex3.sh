#! /bin/bash

# Takes one file as parameter, checks to ensure one parameter was entered
# Verifies parameter is a regular readable file
# File is CSV with five fields: Name, Year, Major, GPA, and State
# Prints the Name and Major for each entry, excludes first line of header info using counting function
# Includes current time on each print line

# Counter function (increments count by one)
incrementby1() {
	expr $1 + 1
}

# Change IFS to comma since we are working with a CSV
IFS=,

# Initializes count variable so we can count the number of lines parsed
count=0

# Verifies that one parameter has been passed in, outputs error 1 if not
if [ $# -ne 1 ]
then
	echo "$0: One parameter (name of file to parse) expected!" 1>&2
	exit 1
fi

# Verifies that the file passed in is a regular readable file, outputs error 2 if not
if ! [ -f "$1" -a -r "$1" ]
then
	echo "$0: The file passed in is not a regular file or is not readable, please try again!" 1>&2
	exit 2
fi

# Loop through each line in the file, print Name, Major, and current time for each line, excludes first line with header info
while read name year major gpa state
do
	# Increment the count variable by one
	count=`incrementby1 $count` 

	# If not the first line, print Name, Major, and current time
	if [ $count -ne 1 ]
	then
		echo "Name $name on `date` has$major as their Major"
	fi
done < "$1"
