# ### Task 1: Basic Functions
# 1. Create `functions.sh` with:
#    - A function `greet` that takes a name as argument and prints `Hello, <name>!`
#    - A function `add` that takes two numbers and prints their sum
#    - Call both functions from the script
#!/bin/bash
myFunction() {
    echo "Hello, Uday!"
}

myFunction

# Another function to add two numbers
sum() {
    local num1=$1
    local num2=$2
    echo "The sum of $num1 and $num2 is: $((num1 + num2))"
}

sum 5 10