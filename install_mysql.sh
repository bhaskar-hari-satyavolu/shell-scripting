#!/bin/bash

ID=$(id -u)

if [ $ID -ne 0 ]
then
    echo "ERROR:: Please run with root access"
    exit 1
else
    echo "You are root user"
fi #fi means reverse of if, indicating the condition end

yum install mysql -y

if [ $? -ne 0 ]
then 
    echo "Installing mysql is failed"
else
    echo "Installing mysql is success"
fi
