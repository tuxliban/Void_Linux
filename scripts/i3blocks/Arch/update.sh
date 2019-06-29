#!/bin/bash 

update=$(checkupdates | cut -d " " -f1 | wc -l)

if [ "$update" = "0" ];then 
    echo -e ""
else
    echo -e " $Update"
fi 
