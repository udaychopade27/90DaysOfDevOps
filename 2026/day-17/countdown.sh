#!/bin/bash
# This script counts down from 1 to 10 using a while loopand prints done at the end of the countdown
counter=10
while [ $counter -ge 1 ]
do
    echo "$counter"
    ((counter--))   
done  
    echo "Done!"  