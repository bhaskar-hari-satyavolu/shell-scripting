#!/bin/bash

VALIDATE(){

    if [ $? -ne 0 ]
    then 
        echo "ERROR:: Installation failed"
    else
        echo "installation success"
    fi
}

ID=$(id -u)

if [ $ID -ne 0 ]
then
    echo "ERROR:: run the commands with root user"
    exit 1
else
    echo "You are a root user"
fi

yum install mysql -y

VALIDATE

yum install git -y

VALIDATE