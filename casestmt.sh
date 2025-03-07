#! /bin/bash

# example of the case statement

case $# in
	0)
		echo "No parameters passed in"
		;;
	1)
		echo "One parameter passed in"
		;;
	2)
		echo "Two parameters passed in"
		;;
	3)
		echo "Three parameters passed in"
		;;
	*)
		echo "Four or more parameters passed in"
		;;
esac
