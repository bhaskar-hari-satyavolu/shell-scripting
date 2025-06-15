#!/bin/bash

VALIDATE(){

    if [ $1 -ne 0 ]
    then 
        echo "ERROR:: $2 failed"
        exit 1
    else
        echo "$2 success"
    fi
}

ID=$(id -u)

TIMESTAMP=$(date +%F-%H-%M-%S)

LOGFILE="/tmp/$0-$TIMESTAMP.log"

if [ $ID -ne 0 ]
then
    echo "ERROR:: run the commands with root user"
    exit 1
else
    echo "You are a root user"
fi

yum install mysql -y &>> $LOGFILE

VALIDATE $? "mysql installion"

yum install git -y &>> $LOGFILE

VALIDATE $? "git installion"