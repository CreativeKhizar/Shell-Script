#! /bin/bash

# Improvements

# Implement log files
# Implement colors
# Implement validations
# Implement validations through functions
# you should check package is already installed  or not, print yellow color
# if installed just print package is already installed, it should not run install command 

user=$(whoami)
DATE=$(date +%F:%H:%M:%S)
SCRIPTNAME=$0

LOGFILE=/home/centos/Shell-Script/shellscript-logs/$SCRIPTNAME-$DATE.log

R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

VALIDATE()
{
    if [ $1 -ne 0 ]; then
        echo -e "$R Installing $2 ... FAILURE$N"
    else
        echo -e "$G Installing $2 ... SUCCESS$N"
    fi
}

if [ $user != 'root' ]; then
    echo "Error Please run the Sheel Script with root access"
    exit 1
fi
for i in $@
do
    yum list installed $i&>> $LOGFILE

    if [ $? -ne 0 ]; then
        echo "$i is not Installed, lets install"
        yum install $i -y &>> $LOGFILE

        VALIDATE $? $i
    else
        echo -e "$Y$i is Already Installed$N"
    fi
done