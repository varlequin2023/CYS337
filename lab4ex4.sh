#! /bin/bash

# Prints the date using specific formulations of the date command and specific cases corresponding to the line the date should be printed on
# Uses a counter to count the number of lines printed, while statement to ensure only 3 lines are printed, case statement for specific line cases

# Counter function (increments count by one)
incrementby1() {
	expr $1 + 1
}

# Initializes count variable so we can count the number of lines printed
count=0

# Loops three times to print each different case
while [ $count -lt 3 ]
do
	# Increments counter by 1
	count=`incrementby1 $count`

	# Prints the correct line (when count=1, case one will print, etc)
	case $count in
		1)
			echo `date +"%A, %B %d, %Y at %H:%M"`
			;;
		2)
			echo `date +"%H:%M on %b %d"`
			;;
		3)
			echo `date +"%m/%d/%Y at %I:%M"`
			;;
		*)
			;;
	esac
done
