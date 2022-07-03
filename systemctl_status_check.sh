#!/bin/bash
value="active"
info=$(systemctl status $1 | awk 'NR==3' | awk '{print $2}')
if [ $info == $value ]
then
    echo  $1 "is running!"
    exit 0
else
    echo  $1 "is not running!"
    exit 2
fi
