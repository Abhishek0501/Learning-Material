#!/bin/bash


#awk program has three sections:
# -> BEGIN {}, MAIN {} and END {} 
# -> processes line by line of the input
# -> Field separator default is blank space
# -> Customizable field separator with FS variable
# -> Each field can be accessed by $i variable, $0 is entire line


#Example 1: Print size of all files
ls -al ~/Desktop | awk 'BEGIN {sum=0}{sum=sum+$5} END {print sum " Bytes"}'

#Example2: Print every third line in ls -al
ls -al ~/Desktop | awk '{for (i=1; i<3; i++) {getline}; print NR,$0}' 

#example3: FS is :
awk '{print $5}' FS=":" /etc/passwd

#example4: Add "" to output
awk '{print q $5 q}' FS=':' q='"' /etc/passwd

#print if line contains
awk '/Directory/ { print $0}' /etc/passwd

#pattern match to specific field
awk -F: '$5 == "_launchservicesd"' /etc/passwd

