#displays the total disk usage of the current directory in a human-readable format 

du -sh

#shows disk space usage for all mounted filesystems in a human-readable format

df -h

#this command allows you to change ownership of all files and subdirectories in the specified directory 

sudo chown -R username:group directory

#how to check peak memory usage of a running process using its PID
#this says how much memory your process requested

grep VmPeak /proc/PID/status 

# this says how much RAM it has ever used 

grep VmHWM /proc/PID/status 

#occasionally programs will fail because "/tmp" runs out of space. To prevent this, you can (bind) mount it to a new location

sudo mount -B /mnt/Data/tmp2 /tmp

#this temp file mount needs to be made permanent in /etc/fstab. The general the format below for doing so is below.

/mnt/Data/tmp2 /tmp none bind 0 0

#if you see system update required when you log into the server, use the following commands to see what is required to be updated and if on Ubuntu, you can search https://ubuntu.com/security/notices to see if its worth doing (usually it is) 

cat /var/run/reboot-required.pkgs 

#setting (virtual) memory limits on shell (this would include RAM + swap + memory-mapped resources). This is for a single session. 

ulimit -v 128k

#allows for system shutdown and rebooting, otherwise it turns off and then you need to turn it on manually or with IDRAC (specific to Dell). "18:00" represents when the shutdown will be scheduled. A system-wide message will be sent to all active users.

sudo shutdown -r 18:00

#to see updates available on the system (these aren't necessarily required)

apt list --upgradable

#Swapfiles and swapiness 

#turning off old swapfile

sudo swapoff /swapfile

#deleting old swapfile to free up space

rm /swapfile

#making new swapfile and allocating disk space to it 

sudo dd if=/dev/zero of=/Data/swapfile bs=1G count=20 oflag=append conv=notrunc

sudo mkswap /Data/swapfile

sudo swapon /Data/swapfile

#security permissions for swapfiles

sudo chmod -v 0600 /Data/swapfile

sudo chown -v root:root /Data/swapfile

#adjusting and assessing the swappiness parameter which is a measure of how readily swap space is used. It is currently 10 which makes sure swap is rarely used unless necessary because it is slow to use. This parameter is fixed in sysctl.conf and does not need to be changed when a new swap file is made. 

sudo sysctl vm.swappiness=10 

#to make permanent swappiness permanent "vim /etc/sysctl.conf" and then add "vm.swappiness = 10" at the end of file

#to get the current swappiness value 

cat /proc/sys/vm/swappiness

#broadcasting to all active system users

wall -n "Hey, everyone" 

#if you are interested in tracking processes or commands, you can see the active ones using the command below where "my_pattern" can be an excerpt of the process or command you are interested in

pgrep -fa my_pattern

#see times in history command output and then activate the changes

echo 'export HISTTIMEFORMAT="%d/%m/%y %T "' >> ~/.bash_profile

. ~/.bash_profile

#how to send yourself an email when a server process is complete "-s" specifies the subject, echo specifies the mail body 

 <your-command-here>; echo "Your for loop finished running" | mail -s "hydra job update" *****@gmail.com

#see who last logged in among a list of users (helps to track what happened when the server crashes or when processes conflict I.e., if you don't have a scheduler (e.g., SLURM) in place

for user in *; do lastlog -u $user;done

#running a task with a predetermined RAM limit (must authenticate as su) 

systemd-run --scope -p MemoryMax=700M

#see when a process was started

ls -ld /proc/PID 

#delay command until first PID finishes

while [ -d /proc/PID-HERE ]; do sleep 0.1; done; <your-command-here>

#make file unreadable and inexecutable for others 

chmod o-r file && chmod o-x file 

#check system architecture 

lscpu

#server alive (helps keep server connections active) modify "/etc/ssh/ssh_config" with the line "ServerAliveInterval 10" 

#check whether hyperthreading is enabled (0 is no 1 is yes)

vim /sys/devices/system/cpu/smt/active

grep -i 'ht' /proc/cpuinfo

#run as other user (helps confirm permissions and conflicts a user is experiencing)

sudo -u usern  <your-command-here>

#facl fine-grained permissions (proceed with caution)

setfacl -m u:user:rx bin/

getfacl bin/
