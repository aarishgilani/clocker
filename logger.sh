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
    echo \"$1\",\"$2\",\"$3\" >> in.csv
}


# Condition check if (clockin)
if [ $do == "in" ]; then
write_csv $current_date $current_day $current_time
fi

# Condition check if (clockout)
if [ "$do" == "out" ]; then
# Read all the files and in array called a
# At the end of the file print array till n-1 element and add current time at the end 
awk -v time="\"$current_time\"" '{a[NR]=$0} END{for(i=1;i<=NR;i++) { if(i==NR) {print $1","time} else print a[i]} }' in.csv > temp && mv temp in.csv
fi

# If input is other than 'in' / 'out' reask the question till correct answer is provided
while [[ $do != 'out' && $do != 'in' ]]; do

echo "Enter a valid input \"in\" for clocking in and \"out\" for clocking out:"
read do
echo $do
done


# Return statement
echo "Clocked you $do for $current_day $current_time"




