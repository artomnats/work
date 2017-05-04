#!/bin/bash

pass1=0
fail1=0
temp=`find /home/arto/work/Bash_script/ -name \*.log`
for i in $temp
do
	if [[ `grep -o pass $i` == "pass" ]]
	then
		let "pass1++"
		file_name=`basename $i .log`
		mv ${file_name}.log ${file_name}_pass.log
		
	elif [[ `grep -o fail $i` == "fail" ]]
	then
		file_name=`basename $i .log`
		mv ${file_name}.log ${file_name}_fail.log
		let "fail1++"
	fi
done
echo "pass="$pass1
echo "fail="$fail1

