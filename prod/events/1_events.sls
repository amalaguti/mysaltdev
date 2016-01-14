# Events

# Install nano and fire and event ONLY if installation is executed
install_nano:
  pkg.installed:
    - name: nano
    - unless:
      - ls /bin/nano

notify_installation: 
  event.wait:
    - name: customEVT/APPS/INSTALL
    - data:
        status: "INSTALLED"
        app: "LATEST NANO"
    - watch:
      - pkg: install_nano
