# Run commands

# Create a file
# Timestamp a file ONLY IF failure executing a valid command (SHOULD NOT TIMESTAMP)
# Timestamp a file ONLY IF failure executing an invalid command (SHOULD TIMESTAMP ALWAYS)


touch_failure_file:
  cmd.run:
    - name: touch /tmp/last_failure.txt
    - creates: /tmp/last_failure.txt
    
timestamp_cmdOK:
  cmd.run:
    - name: date > /tmp/last_failure.txt
    - unless: echo TEST # unless execution succeeds, so no timestamp applied

timestamp_cmdFAIL:
  cmd.run:
    - name: date > /tmp/last_failure.txt
    - unless: wrong_echo TEST # unless execution FAILS, so timestamp applied
