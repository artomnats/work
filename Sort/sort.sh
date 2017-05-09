#!/usr/bin/env bash
count_n=0
count_ch=0
rm -f output.txt
#Is file exist
if [ -e input.txt ]
then
    num_str=`cat ./input.txt`
#Is file row numeric or char
	for p in $num_str
	do
		re='^[0-9]+$'
		#file row is numeric
		if [[ $p =~ $re ]]
		then 
			ar_num=$p" "$ar_num
			((count_n++))
		#file row is char
		else
			ar_char=$p" "$ar_char
			((count_ch++))
		fi
	done
	#sort numeric rows
	for i in $ar_num
	do
		length=`echo $i | wc -m`
		let "length=$length-1"		
		if [ $length -gt 1 ]
		then
			i=`echo ${i:0:1}.${i:1:length}`
		fi
		a_num=$i" "$a_num
	done	
	arr_num=(${a_num// / })	
	for (( i=0; i < $count_n-1 ; i++ ))
	do
		for (( j=0; j < $count_n-$i-1; j++ ))
		do
			let "k=$j+1"
			st=`echo "${arr_num[$j]} > ${arr_num[$k]}" | bc` 
			if [ "$st" == "1" ] 
			then
				#echo "${arr_num[$j]} > ${arr_num[$k]}"
				t=${arr_num[j]}
				arr_num[j]=${arr_num[k]}
				arr_num[k]=$t
			fi
		done
	done
	#sort char rows
	arr_char=(${ar_char// / })
	for (( i=0; i < $count_ch-1 ; i++ ))
	do
		for (( j=0; j < $count_ch-$i-1; j++ ))
		do
			let "k=$j+1"
			if [ "${arr_char[$j]}" \> "${arr_char[$k]}" ]
			then
				#echo "${arr_num[$j]} > ${arr_num[$k]}"
				t=${arr_char[j]}
				arr_char[j]=${arr_char[k]}
				arr_char[k]=$t
			fi
		done
	done
	# Printing the sorted number
	for (( i=0; i < $count_n ; i++ ))
	do
		echo ${arr_num[$i]} | sed "s/\.//" >> output.txt
	done

	#Printing the sorted number	
	for (( d=0; d < $count_ch ; d++ ))
	do
		echo ${arr_char[$d]} >> output.txt
	done
else
	echo File does not exist
	exit 1
fi
 


