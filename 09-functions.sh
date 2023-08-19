#! /bin/bash

# this function should validate the previous command and inform user it is success or failure

VALIDATE()
{
    if [ $? -ne 0 ]; then
        echo "Installation ... FAILURE"
        exit 1
    else
        echo "Installation ... SUCESS"
fi
}
USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "ERROR: Please run this script with root access"
    exit 1
fi

# it is our responsibility again to check installation is successful or not

yum install mysql -y

if [ $? -ne 0 ]; then
    echo "Installation of mysql is error"
    exit 1
else
    echo "Installation of mysql is Sucess"
fi

VALIDATE $?

yum install postfix -y

VALIDATE $?

