# Fixed list of excluded minions to prevent unexpected actions
{% set SALT_EXCLUDED_MINIONS = 'saltmaster,saltlab' %}

#base:
#  '*':
#    - copyfile # base.sls not created
dev:
  'node_type:qa-salt':
    - match: grain
    - copyfile
prod:
  '* not L@{{ SALT_EXCLUDED_MINIONS }}': 
    - match: compound
    - copyfile

