#!/bin/bash

filename="$1"
#echo "$filename"
if [ -z "$filename" ]
then
   echo "Warning missing file after the command."
   exit 1
fi

read -p  "Type Capital (I) for installed packages or Capital (N) for NOT installed packages then press [ENTER]:" input

if [ "I" != "$input" ] || [ "N" != "$input" ]; then
   echo "Asnwer with (I) or (N)"
fi

if [ "$input" = "I" ]; then
	while read p; do
     		rpm -q --qf '%{NAME}-%{VERSION}-%{RELEASE} (%{ARCH})\n' $p  2>/dev/null |grep -v not
	done < "$filename"
        echo "INSTALLED PACKAGES"
elif [ "$input" = "N" ]
   then
	while read p; do
     		rpm -q --qf '%{NAME}-%{VERSION}-%{RELEASE} (%{ARCH})\n' $p  2>/dev/null |grep not
	done < "$filename"
        echo "NOT INSTALLED PACKAGES"
fi
