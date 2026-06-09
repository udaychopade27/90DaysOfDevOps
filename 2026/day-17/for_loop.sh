#!/bin/bash

# Define the array
fruits=("apple", "banana", "orange", "grape", "kiwi")

# Loop through each fruit in the array
for fruit in "${fruits[@]}"
do
    echo "$fruit"
done