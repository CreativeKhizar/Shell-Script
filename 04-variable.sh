#! /bin/bash

# this is the comment, we need to develop a program that can do addition of 2 numbers

NUMBER1=$1
NUMBER2=$2

# I need to run a command inside shell to add these 2 numbers

SUM=$((NUMBER1+NUMBER2))

echo "Addition of $1 and $2 is $SUM"