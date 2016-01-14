# Push "greeting" file
base_push_greeting_file:
  file.managed:
    - name: /tmp/greeting
    - source: salt://1/greeting.txt
    
