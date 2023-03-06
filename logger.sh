#!/bin/bash

# Define where the log files exsist and will be saved


# Change directory to working directory



# Nice greeting for user
echo "Hello Aarish, Good day today! Ready to work?"

read do

# Get current day (eg. Monday) | From system
current_day=$(date +'%A')

# Get current time (eg. 23:24) | From system
current_time=$(date +'%H:%M')

# Get current date (eg. 2023/03/24) | From system
current_date=$(date +'%Y/%m/%d')

# Convention to write data in .csv format
## write_csv $host $date checkout $checkout_time
write_csv(){
    echo \"$1\",\"$2\",\"$3\",\"$4\" >> in.csv
}


# Condition check if (clockin)
if [ $do == "in" ]; then
write_csv $current_date $current_day $current_time
fi

# Condition check if (clockout)
if [ "$do" == "out" ]; then
awk -v day=\"$current_date\" -v time=\"$current_time\" -F "," '{if($1==day) {$4=time}} {print $1","$2","$3","$4}' in.csv > out.csv
fi

# If input is other than 'in' / 'out' reask the question
if [[ $do != 'out' && $do != 'in' ]]; then 

echo "Enter a valid input in for Clock in and out for Clock out"
read do
echo $do
fi


# Return statement
echo "Clocked you $do for $current_day $current_time"




