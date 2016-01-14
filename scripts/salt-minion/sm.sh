#!/bin/bash
# short-cut script to start/stop/debug the salt-minion process
case "$1" in
	start)
		service salt-minion start
		service salt-minion status
		;;
		
	debug)
		salt-minion -l debug
		;;	
	stop)
		service salt-minion stop
		service salt-minion status
esac

