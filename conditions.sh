#!/bin/bash

NUMBER=$1

if [ $NUMBER -gt 100 ]
then
    echo "Give number is greater than 100"
else
    echo "Given number is less than 100"
fi