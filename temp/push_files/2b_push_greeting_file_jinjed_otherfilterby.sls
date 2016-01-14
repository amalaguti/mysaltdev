# Using Jinja grains.filter_by with a different grain (virtual)

{% set greeting = salt['grains.filter_by']({
    'FakeVM': {
        'message': 'FAKEVM',
        'greetingfilename': 'greetingFAKEVM.txt',
    },
    'VirtualBox': {
        'message': 'VIRTUALBOX',
        'greetingfilename': 'greetingVB.txt',
    },
} , grain="virtual", merge=none) %}


push_greeting_file:
  file.managed:
    - name: /tmp/{{ greeting.greetingfilename }}
    - source: salt://push_files/files/greeting.txt
    
