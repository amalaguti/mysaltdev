# Push "greeting" file
push_greeting_file:
  file.managed:
    - name: /tmp/greeting
    - source: salt://1/greeting.txt
  cmd.run:
#    - name: touch /tmp/{{ pillar['pi_company'] }}.txt
    - name: touch /tmp/{{ salt['pillar.get']('pi_company', 'default') }}
