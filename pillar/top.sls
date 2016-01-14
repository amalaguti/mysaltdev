#base:
#  '*':
#    - copyfile # base.sls not created
dev:
  'node_type:qa-salt':
    - match: grain
    - qa.qa-pillars
prod:
  '*':
    - prod.prod-pillars
