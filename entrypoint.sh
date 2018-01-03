#!/bin/sh
if [[ ${type} == "supernode" ]]; then
	/usr/local/sbin/supernode --help
	/usr/local/sbin/supernode -l $listenport -f $OPTIONS
elif [[ ${type} == "edge" ]]; then
	/usr/local/sbin/edge --help
	/usr/local/sbin/edge -d $devicename -a $interfaceaddress -c $communityname -k $Encryptionkey -l $supernodenet -f $OPTIONS  
fi
