# BOOTABLE USB

### Description
Enumerates the cli commands required to create a bootable usb installation media from a given iso file (run on Linux, but should also work for Mac)

### Linux Process
1. Download the desired **iso** file (e.g. https://linuxmint.com/download.php)
2. Identify the appropriate usb device (Choose **/dev/sdX** from the following command's output)
``` bash
sudo fdisk -l
```
3. Unmount the usb device
``` bash
sudo umount /dev/sdX
```
4. Clear the usb device (BE CAREFUL!)
``` bash
sudo dd if=/dev/zero of=/dev/sdX bs=1M status=progress
```
5. Write iso image to the usb device (BE CAREFUL!)
``` bash
sudo dd if=PATH_TO_ISO of=/dev/sdX bs=4M conv=fdatasync status=progress
```

### Windows Process
The above Linux process did not work for me when creating a Windows 10 bootable USB.
Neither did woeusb or the disk utility process described at https://itsfoss.com/bootable-windows-usb-linux/

### Notes
* I frequently encountered the error message
```
"dd: error writing '/dev/sdc': No space left on device"
```
This did not create problems with the zero or iso copying, but did cause the cli command to hang for a few minutes: just be patient :)
* This process worked for Linux Mint 19.3
