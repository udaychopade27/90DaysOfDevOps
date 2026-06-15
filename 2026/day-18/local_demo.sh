#!/bin/bash
# Function with local variable
localFunction() {
    local localVar="I am a local variable"
    globalVar="I am a global variable"
    echo "Inside localFunction: $localVar"
    echo "Trying to access globalVar inside the function..."
    echo "Inside localFunction: $globalVar"
} 
localFunction
echo "Calling localFunction..."
echo "Trying to access localVar outside the function..."
echo "localVar is: ${localVar:-undefined}"
echo "Trying to access globalVar outside the function..."
echo "globalVar is: $globalVar"

