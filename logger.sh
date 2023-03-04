#!/bin/bash

# Define where the log files exsist and will be saved


# Change directory to working directory



# Nice greeting for user
echo "Hello Aarish, Good day today! Ready to work?"

read do

# Get current day | From system
current_day=$(date +'%A')

# Get current time | From system
current_time=$(date +'%H:%M')

# Convention to write data in .csv format
## write_csv $host $date checkout $checkout_time
write_csv(){
    echo \"$1\",\"$2\",\"$3\",\"$4\" >> in.csv
}


# Condition check if (clockin)
if [ $do == "in" ]; then
write_csv $current_day $current_time
fi

# Condition check if (clockout)
if [ "$do" == "out" ]; then
awk -v day=\"$current_day\" -v time=\"$current_time\" -F "," '{if($1==day) {$3=time}} {print $1","$2","$3}' in.csv > out.csv
fi

# If input is other than 'in' / 'out' reask the question
if [[ $do != 'out' && $do != 'in' ]]; then 

echo "Enter a valid input in for Clock in and out for Clock out"
read do
echo $do
fi


# Return statement
echo "Clocked you $do for $current_day $current_time"




