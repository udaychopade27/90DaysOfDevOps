#!/bin/bash
# This script demonstrates the use of variables in shell scripting
# Define a variable
greeting="Hello, Nice to meet you!"
# Print the variable
echo $greeting
# Define another variable
name="Uday"
# Use the variable in a sentence
echo "My name is $name."
# Define a variable with a command output
current_date=$(date)
echo "Today's date is: $current_date"
# Define a variable with arithmetic operation
num1=27
num2=06
sum=$((num1 + num2))
echo "The sum of $num1 and $num2 is: $sum"  

current_dir=$(pwd)
echo "The current directory is: $current_dir"
