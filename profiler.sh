#! /bin/bash
printf "Memory\t\tDisk\t\tCPU\n"
end=$((SECONDS+3600))
i=0
username_orig="esokullu"
while [ $SECONDS -lt $end ]; do
let "i++"
username=username_orig$i
MEMORY=$(free -m | awk 'NR==2{printf "%.2f%%\t\t", $3*100/$2 }')
DISK=$(df -h | awk '$NF=="/"{printf "%s\t\t", $5}')
CPU=$(top -bn1 | grep load | awk '{printf "%.2f%%\t\t\n", $(NF-2)}')
http POST :1337/actor param1="$username" param2="$username"@groupsfiles.com param3="123456" > /dev/null 2>&1
echo "$MEMORY$DISK$CPU"
sleep 0.3
done
