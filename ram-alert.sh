#!/bin/bash
TH_L=400
to=anushamr29@gmail.com
free_RAM=$(free -mt | grep -E "Total" |awk '{print $4}')
if [ $free_RAM -lt $TH_L ]
then
echo -e "server low ram" | send mail "ram info $(date)" $to
fi
