#! /bin/bash

# this function should validate the previous command and inform user it is success or failure

DATE=$(date +%F:%H:%M:%S)
SCRIPTNAME=$0
LOGFILE=/tmp/$SCRIPTNAME-$DATE.log

VALIDATE()
{
    if [ $1 -ne 0 ]; then
        echo "$2 ... FAILURE"
        exit 1
    else
        echo "$2 ... SUCCESS"
fi
}
USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "ERROR: Please run this script with root access"
    exit 1
fi

# it is our responsibility again to check installation is successful or not

yum install mysql -y 

VALIDATE $? "INSTALLING MYSQL"

yum install postfix -y

VALIDATE $? "INSTALLING POSTFIX"

