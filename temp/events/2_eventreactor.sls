# Fire a custom event and react
#		Event Data:
#		"id": "ubuntu1",
#		"tag": "customEVT/APPS/INSTALL"
#		"app": "LATEST NANO"
#		"status": "INSTALLED"
    
notify_installation: 
  event.send:
    - name: customEVT/APPS/INSTALL
    - data:
      - status: "INSTALLED"
      - app: "LATEST NANO"

