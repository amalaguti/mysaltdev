#!/bin/bash
#
# Script to detect if patch was applied by reading content in /tmp/patch file
# Produces output supporting stateful state to detect change 

# patched=1 means patch is applied
patched=$(grep "patched=1" /tmp/patched)

timestamp=$(date)
if [ X$patched = X"patched=1" ]
then
	stateful_output="changed=YES comment='PATCH DETECTED' timestamp='$timestamp'"
else 
	stateful_output="changed=NO comment='PATCH NOT DETECTED' timestamp='$timestamp'"
fi
	
# writing the stateful output line
#stateful_output="changed=yes comment='something has changed' whatever=123"
echo  # an empty line here so the next line will be the last.
echo $stateful_output