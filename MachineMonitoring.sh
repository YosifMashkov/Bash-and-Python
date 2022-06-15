#!/bin/bash

CPU_Load(){
echo "CPU Usage: "$[100-$(vmstat 1 2|tail -1|awk '{print $15}')]"%"
read -p "Press any key to Continue..."
}

RAM_Usage(){
echo "RAM Usage: "
free
read -p "Press any key to Continue...."
}

DISK_Usage(){
echo "DISK Usage: "
df
read -p "Press any key to Continue..."
}

show_menu(){
clear
echo "++Would you like to see:++"
echo “1. CPU Load."
echo "2. RAM Usage."
echo "3. DISK Usage."
echo "4. Exit."
echo "++++++++++++++++++++++"
}

take_input(){
local choice
read -p "Select an option from the menu above: " choice

case $choice in
1)
CPU_Load
;;
2)
RAM_Usage
;;
3)
DISK_Usage
;;
4)
break
;;
*)
echo -e "Invalid Option!"
read -p "Press any key top Continue...."
esac
}

while true
do
show_menu
take_input
done
