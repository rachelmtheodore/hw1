#!/bin/bash

# Check number of lines in stimuli.log.
echo "Lines in stimuli.log:"
wc -l stimuli.log

# Identify each condition as unique values of second vector in stimuli.log; set as variable Condition.
# The -F'' option for awk identifies vector seperator; here it is a space.
Condition=$(awk -F' ' '{ print $2 }' stimuli.log | sort | uniq)

# Report in console the identified values for Condition.
echo "These values were identified for the variable Condition:"
echo $Condition

# For each value of variable Condition, identify matching rows in stimuli.log.
# For these rows, pass the first vector of stimuli.log to a file named by Condition value with .1d suffix.
# The -i option is not indicated for grep; search will be case-sensitive.
for condition in $Condition
	do
		cat stimuli.log | grep $condition | awk -F ' ' '{print $1}' > data/$condition.1d
	done

# Report in terminal the number of lines in each file of subdirectory data/; confirm files were created.
echo "Lines for each file in data/:"
wc -l data/*