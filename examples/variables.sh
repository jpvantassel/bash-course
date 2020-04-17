#!/bin/bash 

echo " "
echo "------ Concatenation -----"

a="Ta"                          # Define string Ta
b="Da"                          # Define string Da
c=$a$b                          # Define concatenation of a and b
echo $c                         # Show the concatenation-> TaDa

echo " "
echo "----- Slicing String by Position -----"

echo "********* Part 1 *********"

string="This is a long string"  # Define a String

echo ${string:0:4}              # Echo the first 4 characters of string
# --> This

echo ${string: -6}              # Echo the last 6 characters. Note the space!
# --> string


echo "********* Part 2 *********"
string="This is a long string"  # Define a String
echo ${#string}                 # Echo the length of the String
# --> 21
echo ${string:0:${#string}-7}   # Echo the string minus the last 7 characters
# --> This is a long

echo " "
echo "----- Slicing String by Pattern -----"

echo "********* Part 1 *********"

x=abcABC123ABCabc

echo ${x#a*b}                   # Delete shortest match from front
# --> cABC123ABCabc

echo ${x##a*b}                  # Delete longest match from front
# --> c

echo ${x%b*c}                   # Delete shortest match from back
# --> abcABC123ABCabc

echo ${x%%b*c}                  # Delete longest match from back
# --> a

echo "********* Part 2 *********"

file=/user/johndoe/c/interesting/info.txt

path=${file%/*}                 # Delete everything after and including the last "/"
echo ${path}
# --> /user/.../interesting

name=${file##*/}                # Delete everything before and including the last "/"
echo ${name}
# --> info.txt

end=${name##*.}                 # Delete everything before and including the last "."
echo ${end}
# --> txt

short=${name%%.*}               # Delete everything after and including the last "."
echo ${short}
# --> info


echo " "
echo "----- Replacing Text -----"

string="This is a long string"  # Define a String
echo ${string/i/!}              # Replace first instance of i with !
# --> Th!s is a long string

echo ${string//i/!}             # Replace all instances of i with !
# --> Th!s !s a long str!ng

echo ${string/#T/B}             # Replace T at start of string with B
# --> Bhis is a long string

echo ${string/%ng/foo}          # Replace ng at end of string with foo
# --> This is a long strifoo

echo ${string/s*/blah}          # Replace s followed by char(s) blah
# --> This isblah
