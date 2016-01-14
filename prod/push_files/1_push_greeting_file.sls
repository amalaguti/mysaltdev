# Push "greeting" file
push_greeting_file:
  file.managed:
    - name: /tmp/greeting
    - source: salt://push_files/files/greeting.txt
    
