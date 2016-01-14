# Run commands

# Timestamp to a file IF 'patched' file does not exist 
# Logic:	a patch_applied is created by another process when patch is applied
#			If file does not exist (creates TRUE), means patch is not applied  and 
#			last_check.txt file must be timestampted

create_timestamp:
  cmd.run:
    - name: date > /tmp/last_check.txt
    - creates: /tmp/patch_applied
    
    