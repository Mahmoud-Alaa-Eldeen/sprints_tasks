#!/usr/bin/env bash 
if [ -e ~/reports ]
then 
     echo "directory exists"

else
    mkdir ~/reports
fi


if [ -e ~/reports_bakcup ]
then 
     echo "backup directory exists"

else
    mkdir ~/reports_bakcup
fi



start=2022-01-01
end=2022-12-31
while ! [[ $start > $end ]]; do
    if  [ !  -e  ~/reports/"$start.xls" ]
    then
         touch  ~/reports/"$start.xls"
    fi
    
    start=$(date -d "$start + 1 day" +%F)
done
