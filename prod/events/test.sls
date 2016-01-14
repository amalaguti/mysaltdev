# Stand up a new web server.
nano:
  pkg:
    - installed
    - name: nano

# Notify the load balancer to update the pool once Apache is running.
refresh_pool:
  event:
    - wait
    - name: mycompany/loadbalancer/pool/update
    - data:
        new_web_server_ip: {{ grains['ipv4'] | first() }}
    - watch:
      - pkg: nano