#! /bin/bash

# This script will ask a user for their favorite food and respond accordingly

# Prompts user for their favorite food, reads user input
echo "What is your favorite food?"
read favfood

# Determines how to respond and responds accordingly
case "$favfood" in
	"pizza")
		echo "Pizza! Plain or Pepperoni?"
		;;
	"soup")
		echo "Soup! Tomato or Chicken Noodle?"
		;;
	"chicken")
		echo "Why did it cross the road?"
		;;
	*)
		echo "I like that too!"
		;;
esac

