#!/bin/bash

# Nice greeting for user
echo "Hello Aarish, Good day today! Ready to work?"

read do

echo $do

# Get current day | From system
current_day=$(date +'%A')

# Get current time | From system
current_time=$(date +'%H:%M')

# Convention to write data in .csv format
## write_csv $host $date checkout $checkout_time
write_csv(){
    echo \"$1\",\"$2\",\"$3\",\"$4\" >> log.csv
}


# Condition check if (clockin)
if [$do == "in"]; then
write_csv $current_day $current_time
fi

# Condition check if (clockout)
if ["$do" == "out"]; then

write_csv $current_day $current_time

fi

# If input is other than 'in' / 'out' reask the question

if [[ $do != 'out' && $do != 'in' ]]; then 

echo "Enter a valid input in for Clock in and out for Clock out"
read do
echo $do
fi


# Return statement
echo "Clocked $do you for $current_day $current_time"




