#!/bin/bash

pass1=0
fail1=0
temp=`find ./ -name \*.log`
for i in $temp
do
	name_b=`basename $i .log`
	name_d=`dirname $i` 
	if [[ `grep -o pass $i` == "pass" ]]
	then
		let "pass1++"
		mv ${name_d}/${name_b}.log ${name_d}/${name_b}_pass.log
		
	elif [[ `grep -o fail $i` == "fail" ]]
	then
		mv ${name_d}/${name_b}.log ${name_d}/${name_b}_fail.log
		let "fail1++"
	fi
done
echo "pass="$pass1
echo "fail="$fail1

