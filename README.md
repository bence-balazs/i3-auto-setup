# i3-auto-setup

Login as root user

```sh
apt install git -y
```
then
```
git clone https://github.com/bence-balazs/i3-auto-setup.git
```

Then run the ```i3setup.sh``` -script as root user.
Now we have a basic debian install with i3VM.

Restart i3: ```shift+super+R```
Exit i3: ```shift+super+E```

**Optional fine tuning:**
    - set bottom bar bigger: ```vi .config/i3/config``` at line 16 set the font(8) bigger(12). restart i3

**Auto resize settings:**
In virt-manager: menu>view>scale display> ```ALWAYS``` + ```Auto resize VM```
Known bug: At every cold start need to login then exit i3, then the auto resize should work just fine.

**Folder sharing setup:**
The required packages already installed.
Shut down the vm.
In virt-manager: VM-detials>Memory>Enable shared memory
In virt-manager: Add hardware>Filesystem
    - Driver: virtiofs
    - Source path: /home/userOnHost/Public/vm-share
    - Target path: vm-share

In the ```GUEST-VM```
    - ```mkdir ~/shares```
Switch to root user ```su -```
Edit the fstab to auto mount with every startup: ```vi /etc/fstab```
Add the following line at bootom:
```vm-shares	/home/USER/shares virtiofs, defaults 0 0``` (change username)
Reboot the system, filesharing should work now.