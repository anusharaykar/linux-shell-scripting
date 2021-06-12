#!/bin/bash
file_usage_threshold=80
df -Ph | grep -vE "Filesystem|tmpfs|none|cfgs|loop" | while read line
do
file_name=$(echo $line | awk '{print $1}')
file_usage=$(echo $line | awk '{print $5}' | sed 's/%//g')
echo "filesystem name:$file_name,file system usage:$file_usage"
if [ $file_usage -gt $file_usage_threshold ]
then

echo "$file_name : $file_usage" >> file_sys_info.txt
fi
done
cont=$(cat file_sys_info.txt|wc -l)
if [ $cont -gt 0 ]
then
echo "some file system usage is > threshold"
#cat file_sys_info.txt
echo -e "subject :alert \n\n |$(cat file_sys_info.txt)"|sendmail "anushamr29@gmail.com"
fi
