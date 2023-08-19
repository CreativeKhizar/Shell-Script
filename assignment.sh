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

LOGFILE=/tmp/$SCRIPTNAME-$DATE.log

R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"
VALIDATE()
{
    if [ $0 -ne 0 ]; then
        echo -e "$RInstalling $1 ... FAILED$N"
    else
        echo -e "$GInstalling $1 ... SUCCESS$N"
    fi
}

if [ $user != 'root' ]; then
    echo "Failed Run the Sheel Script with root user"
    exit 1
fi
for i in $@
do
    yum list $i &>> $LOGFILE

    if [ $? -ne 0 ]; then
        echo "$i is not Installed, lets install"
        yum install $i &>> $LOGFILE

        VALIDATE $? $i
    else
        echo -e "$Y$i is Already Installed$N"
    fi
done