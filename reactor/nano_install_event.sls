# Event Reactor state file 
# Copy new nano configuration file
# Backup global nano configuration file
# NOTE: instead of using a standard command line to backup the file this state 
#       uses the file.state.backup function to standardize the procedure
#		Backup file will be placed in /var/cache/salt/minion/file_backup/
#
apply_nano_config:
  local.state.sls:
    - tgt: {{ data['id'] }}
    - arg:
      - apps.nano.nano_install_event
      
    