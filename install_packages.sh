#!/bin/bash

ID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

DATE=$(date +%F-%H-%M-%S)
LOGFILE="/tmp/$0-$DATE.log"

echo "script started executing at $DATE"

VALIDATE(){

    if [ $1 -ne 0]
    then 
        echo "ERROR:: $2 Failed"
    else
        echo "$2 success"
    fi
}

if [ $ID -ne 0 ]
then
    echo -e "$R ERROR::$N run the script with root user"
else
    echo "You are a root user"
fi

for package in $@
do
    yum list installed $package
    if [ $? -ne 0]
    then
        yum install $package -y &>> LOGFILE
        VALIDATE $? "Installation of $package"
    else
        echo -e "$G package is already installed$N"
    fi
done