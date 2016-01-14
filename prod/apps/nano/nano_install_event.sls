# 
# Copy new nano configuration file
# Backup global nano configuration file
# NOTE: instead of using a standard command line to backup the file this state 
#       uses the file.state.backup function to standardize the procedure
#		Backup file will be placed in /var/cache/salt/minion/file_backup/
#

push-and-backup_nano_configuration:
  file.managed:
    - name: /etc/nanorc
    - source: salt://apps/nano/files/nano_configuration
    - backup: minion

