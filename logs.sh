#!/bin/bash

R="\e[31m"
G="\e[32m"
N="\e[0m"

VALIDATE(){

    if [ $1 -ne 0 ]
    then 
        echo -e "ERROR:: $2 $R failed $N"
        exit 1
    else
        echo -e "$2 $G success $N"
    fi
}

ID=$(id -u)

TIMESTAMP=$(date +%F-%H-%M-%S)

LOGFILE="/tmp/$0-$TIMESTAMP.log"

if [ $ID -ne 0 ]
then
    echo -e "$R ERROR$N:: run the commands with root user"
    exit 1
else
    echo -e "$G You are a root user$N"
fi

yum install mysql -y &>> $LOGFILE

VALIDATE $? "mysql installion"

yum install git -y &>> $LOGFILE

VALIDATE $? "git installion"