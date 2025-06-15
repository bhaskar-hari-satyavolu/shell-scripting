#!/bin/bash

VALIDATE(){

    if [ $1 -ne 0 ]
    then 
        echo "ERROR:: $2 $R failed $N"
        exit 1
    else
        echo "$2 $G success $N"
    fi
}

ID=$(id -u)

TIMESTAMP=$(date +%F-%H-%M-%S)

R="\e[31m"
G="\e[32m"
N="\e[0m"

LOGFILE="/tmp/$0-$TIMESTAMP.log"

if [ $ID -ne 0 ]
then
    echo "$R ERROR$N:: run the commands with root user"
    exit 1
else
    echo "$G You are a root user$N"
fi

yum install mysql -y &>> $LOGFILE

VALIDATE $? "mysql installion"

yum install git -y &>> $LOGFILE

VALIDATE $? "git installion"