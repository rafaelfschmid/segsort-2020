#!/bin/bash
out=$1
generator=$2

echo "" > $out/nthrust.time		

n=32768
while [ $n -le 134217728 ]
do
	s=1
	while [[ $s -lt $n && $s -le 1048576 ]] 
	do
		echo -e "\n"$s"\n"$n >> $out/nthrust.time				
		i=1
		while [ $i -le  10 ] 
		do
			in=$s"_"$n"_"$i".in"
			./$generator $s $n > $in

			./nthrust.exe	< $in	>> $out/nthrust.time				
			rm -f $in
			((i=$i+1))
		done
		((s=$s*2))
		
	done
	((n=$n*2))
done
