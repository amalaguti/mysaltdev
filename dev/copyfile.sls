# Push "greeting" file
push_greeting_file:
  file.managed:
    - name: /tmp/greeting
    - source: salt://1/greeting.txt
    
