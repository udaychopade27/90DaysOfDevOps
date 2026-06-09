# Day 17 – Shell Scripting: Loops, Arguments & Error Handling

## Objective

Learn how to automate Linux tasks using shell scripting by working with loops, command-line arguments, package installation automation, and error handling.

---

# Task 1 – For Loop

## 1. count.sh

### Purpose

Print numbers from 1 to 10 using a for loop.

```bash
#!/bin/bash

for i in {1..10}
do
    echo "$i"
done
```

### Sample Output

```text
1
2
3
4
5
6
7
8
9
10
```

---

## 2. for_loop.sh

### Purpose

Loop through an array and print each fruit.

```bash
#!/bin/bash

fruits=("apple" "banana" "orange" "grape" "kiwi")

for fruit in "${fruits[@]}"
do
    echo "$fruit"
done
```

### Sample Output

```text
apple
banana
orange
grape
kiwi
```

---

# Task 2 – While Loop

## countdown.sh

### Purpose

Count down from a number.

```bash
#!/bin/bash

counter=10

while [ $counter -ge 1 ]
do
    echo "$counter"
    ((counter--))
done

echo "Done!"
```

### Sample Output

```text
10
9
8
7
6
5
4
3
2
1
Done!
```

---

# Task 3 – Command Line Arguments

## greet.sh

### Purpose

Accept a name and print greeting.

```bash
#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: ./greet.sh <name>"
else
    echo "Hello, $1!"
fi
```

### Example

```bash
./greet.sh Uday
```

Output:

```text
Hello, Uday!
```

---

## args_demo.sh

### Purpose

Understand script arguments.

```bash
#!/bin/bash

echo "Total number of arguments: $#"
echo "All arguments: $@"
echo "Script name: $0"
```

Example:

```bash
./args_demo.sh devops linux aws
```

Output:

```text
Total number of arguments: 3
All arguments: devops linux aws
Script name: ./args_demo.sh
```

---

# Task 4 – Install Packages via Script

## install_packages.sh

```bash
#!/bin/bash

packages=("nginx" "curl" "wget")

if [ "$EUID" -ne 0 ]; then
    echo "Please run as root"
    exit
fi

for package in "${packages[@]}"
do
    if dpkg -s "$package" &> /dev/null; then
        echo "$package is already installed."
    else
        echo "$package is not installed. Installing..."
        apt-get update && apt-get install -y "$package"
    fi
done
```

### Features

* Package existence validation
* Automated installation
* Root access validation

---

# Task 5 – Error Handling

## safe_script.sh

```bash

#!/bin/bash
set -e

#  Define the directory and file names
DIR_NAME="my_safe_directory"
FILE_NAME="my_safe_file.txt"    
# Create the directory
if ! mkdir -p "$DIR_NAME"; then 
    echo "Error: Failed to create directory '$DIR_NAME'."
    exit 1
fi
# Navigate into the directory
if ! cd "$DIR_NAME"; then   
    echo "Error: Failed to navigate into directory '$DIR_NAME'."
    exit 1
fi
# Create the file
if ! touch "$FILE_NAME"; then
    echo "Error: Failed to create file '$FILE_NAME'."
    exit 1
fi
echo "Directory '$DIR_NAME' and file '$FILE_NAME' created successfully."    

```

### Output

```text
Script executed successfully
```

---

# Key Learnings

✅ Use for loops for repetitive operations

✅ Use command-line arguments to make scripts reusable

✅ Add validation and error handling for reliable automation

---

# Day 17 Takeaway

Shell scripting is not just writing commands — it is converting manual work into repeatable and reliable automation, which is a core DevOps skill.
