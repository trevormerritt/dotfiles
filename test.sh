#!/bin/bash

 _battery() {
   count=0
   charge=0
   uname_s=$(uname -s)
   case "$uname_s" in
     *Darwin*)
       while IFS= read -r line; do
         if [ x"$discharging" != x"true" ]; then
           discharging=$(printf '%s' "$line" | grep -qi "discharging" && echo "true" || echo "false")
         fi
         percentage=$(printf '%s' "$line" | grep -E -o '[0-9]+%')
         charge=$(awk -v charge="$charge" -v percentage="${percentage%%%}" 'BEGIN { print charge + percentage / 100 }')
         count=$((count + 1))
       done 
 }
 $(pmset -g batt | grep 'InternalBattery')

battery()