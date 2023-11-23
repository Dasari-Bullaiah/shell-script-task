#!/bin/bash

lines=$(cat joindevops.txt|wc -l)

filename=$1
nthline=$2

ways=("using head/tail" "using sed" "using awk")


if [ $nthline -gt $lines ]
then
	echo -e "\e[31m $filename doesn't have $nthline \e[0m"
else
	for way in "${ways[@]}"
	do
		case $way in
		"using head/tail")
			echo -n "Using head/tail"
			findnthline1=$(cat joindevops.txt|head -$nthline|tail -1)
			echo -e "\e[32m $nthline line from $filename::  $findnthline1 \e[0m"
			;;
		"using sed")
			echo -n "Using sed"
			findnthline2=$(cat joindevops.txt|sed -n '11p')
			echo -e "\e[32m $nthline line from $filename:: $findnthline2 \e[0m"
			;;
		"using awk")
			echo -n "Using awk"
			findnthline3=$(cat joindevops.txt|awk 'NR==11')
			echo -e "\e[32m $nthline line from $filename::  $findnthline3 \e[0m"

			;;
		*)
			echo -n "will use more commands"
			;;
		esac
	done
fi

