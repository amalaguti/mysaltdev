# Run commands

# Mimics patch installation by executing command (/tmp/patched => patched=1) 
# Then deploys and execute custom script to verify patch installation
# (patched=1 in /tmp/patched means patch was installed successfully)
# The script outputs satisfy the stateful rules
# echo "changed=yes comment='PATCH APPLIED' whatever=123"
# changed=yes (or true) indicates the script produced a change which in turns fires the 
# event from minion as dictated by "Run only if patch applied"
# If patched=0 means patch is not installed, so the state does not fire event


# Mimic patch deployment 
apply_patch:
  cmd.run:
    - name: echo "patched=0" > /tmp/patched

# Push and apply script to verify patch installation
verify_patch_applied:
  cmd.script:
    - name: check_patch.sh
    - source: salt://cmds/files/check_patch.sh
    - cwd: /tmp
    - stateful: True

Trigger event if patch applied:
  cmd.wait:
    - name: salt-call event.fire 'PATCH APPLIED' 'APPS/PATCHED'
    - watch:
      - cmd: verify_patch_applied
