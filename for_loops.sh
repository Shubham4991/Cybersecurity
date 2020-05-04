#!/bin/bash
nums=$(echo {0..9])
states=('Nebraska' 'California' 'Texas' 'Hawaii' 'Washington')
ls_out=$(ls)

for num in ${nums[@]};
do
	new_num=$(($num + 2))
	echo $new_num
done

for state in ${states[@]};
do
 if [ $state == 'New York' ];
 then
 echo "New York"
 else
 echo "not a fan"
 fi
done

for x in ${ls_out[@]};
do
 echo $x
done

suids=$(find / -type f -perm /4000 2> /dev/null)
for suid in ${suids[@]};
do
 echo $suid
done
