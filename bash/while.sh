#!/bin/bash

i=1
while ((i<14)); do
	cdsk create_vol --file_name /home/wang/crypto/d$i --passphrase none --file_size 20m
	cdsk open_vol --file_name /home/wang/crypto/d$i --passphrase Zzz1234 --mount_path /home/wang/crypto/mount/d$i
	((i++))
	# sleep 1
done
