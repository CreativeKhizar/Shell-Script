#! /bin/bash

# this function should validate the previous command and inform user it is success or failure

DATE=$(date +%F:%H:%M:%S)
SCRIPTNAME=$0
LOGFILE=/tmp/$SCRIPTNAME-$DATE.log
USERID=$(id -u)

R="\e[31m"
G="\e[32m"
N="\e[0m"

VALIDATE()
{
    if [ $1 -ne 0 ]; then
        echo "$R$2 ... FAILURE$N"
        exit 1
    else
        echo "$G$2 ... SUCCESS$N"
fi
}


if [ $USERID -ne 0 ]; then
    echo "ERROR: Please run this script with root access"
    exit 1
fi

# it is our responsibility again to check installation is successful or not

yum install mysql -y &> $LOGFILE

VALIDATE $? "INSTALLING MYSQL"

yum install postfix -y &> $LOGFILE

VALIDATE $? "INSTALLING POSTFIX"

