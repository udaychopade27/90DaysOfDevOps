#!/bin/bash
# This script demonstrates the use of bash script to check number is even or odd or number operations
# Read a number from user
echo "Enter a number:"
read number 
# Check if the number is even or odd
if [ $((number % 2)) -eq 0 ]; then
    echo "$number is an even number."
else
    echo "$number is an odd number."
fi 

echo "Performing some number operations..."
# Check if the number is positive, negative or zero
if [ $number -gt 0 ]; then
    echo "$number is a positive number."
elif [ $number -lt 0 ]; then
    echo "$number is a negative number."
else
    echo "The number is zero."
fi

# check if number is prime or not
is_prime=true
if [ $number -le 1 ]; then
    is_prime=false
else
    for ((i=2; i<=number/2; i++)); do
        if [ $((number % i)) -eq 0 ]; then
            is_prime=false
            break
        fi
    done
fi  
if [ "$is_prime" = true ]; then
    echo "$number is a prime number."
else
    echo "$number is not a prime number."
fi
    