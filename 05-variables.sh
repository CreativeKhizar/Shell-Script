#! /bin/bash

echo "Please Enter your Username "

read USERNAME # this is the variable where the value of the user entered

echo "User Name Entered is $USERNAME"

# this is only for validation, we should not print like this

echo "Please Enter your Password"

read -s PASSWORD

echo "Password entered is: $PASSWORD"