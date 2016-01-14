# Using Jinja grains.filter_by

{% set greeting = salt['grains.filter_by']({
    'Debian': {
        'message': 'DEBIAN',
        'greetingfilename': 'greetingDEB.txt',
    },
    'RedHat': {
        'message': 'RedHat',
        'greetingfilename': 'greetingRH.txt',
    },
} , grain="os_family", merge=none) %}


push_greeting_file:
  file.managed:
    - name: /tmp/{{ greeting.greetingfilename }}
    - source: salt://push_files/files/greeting.txt
    
