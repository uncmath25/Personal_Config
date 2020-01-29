# PC HARDWARE NOTES

### DONT CHANGE SATA CONNECTIONS
* Sends Linux EFI paritioned drives to the grub menu - was not able to reboot from here
* Also was not able to read ext4 partitions from devices which had SATA cables changes

### Explore
* Check drives
``` bash
sudo fdisk -l
```
* Check mounted drives
``` bash
df -h
```
* Determine "X" for "sdX" below - BE CAREFUL

### Format
* Format and partition HDD
``` bash
sudo fdisk /dev/sdX
```
    * **g** create gpt partition table
    * **n** create new partition - choose defaults
    * **w** write changes to disk
* Create Linux ext4 file system on new partition
``` bash
sudo mkfs.ext4 /dev/sdX1
```

### Verify
* Confirm that device can be mounted
``` bash
sudo mount /dev/sdX1 /mnt
```
* Create a temporary file to test write capabilities and confirm that the file still exists after reboot

### Automate
* Check device UUID
```
sudo blkid
```
* Add the following entry to /etc/stab to mount the HDD on boot:
```
UUID=<DEVICE_UUID> /data         ext4    errors=remount-ro,auto,exec,rw,user 0   0
```
