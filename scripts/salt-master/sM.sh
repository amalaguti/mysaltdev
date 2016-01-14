#!/bin/bash
# short-cut script to start/stop/debug the salt-master process
case "$1" in
	start)
		service salt-master start
		service salt-master status
		;;
		
	debug)
		salt-master -l debug
		;;	
	stop)
		service salt-master stop
		service salt-master status
esac

