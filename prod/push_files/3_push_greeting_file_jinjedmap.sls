# Push files and add content using vars and jinja maps

# Define base vars
{% set MSG_FOLDER = '/tmp/' %}
{% set SALT_SRC_FOLDER = 'salt://push_files/files/' %}

# Import greeting dictionary from jinja map
{% from "push_files/map.jinja" import greeting with context %}



# Copy greeting file
push_greeting_file:
  file.managed:
    - name: {{ MSG_FOLDER }}{{ greeting.greetingfilename }}
    - source: {{ SALT_SRC_FOLDER }}{{ greeting.greetingfilename }}



# Append message to greeting file
append_greeting_message:
  file.append:
    - name: {{ MSG_FOLDER }}{{ greeting.greetingfilename }}
    - text: {{ greeting.message }}



