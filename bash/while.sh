#!/bin/bash

i=1
while ((i<14)); do
	#cdsk create_vol --file_name /home/wang/crypto/d$i --passphrase none --file_size 20m
	#cdsk open_vol --file_name /home/wang/crypto/d$i --passphrase Zzz1234 --mount_path /home/wang/crypto/mount/d$i
	((i++))
	# sleep 1
done

i=1
while [ $i -lt 4 ]
do
    i=$[$i+1]
    echo $i
done

j=1
i=1
while [ $i -lt 4 ] && [ $j -lt 8 ] && [ ! -f file_exist ]
do
	i=$[$i+1]
	j=$((j+2))
	echo $i $j
done
