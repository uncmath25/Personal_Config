# PC Debug

### Recover from GUI Cinnamon failure
Enter recovery terminal: ctrl+alt+F1
Login with username and password
``` bash
sudo apt-get update
sudo apt-get install -y nemo cinnamon
reboot
```

### Fix "execution of cinnamon-settings X failed"
``` bash
sudo apt-get install -y cinnamon cinnamon-common cinnamon-settings-daemon cinnamon-settings-daemon-dev
```
