sudo -i
groupadd btsync
useradd remote -d /home/remote -G btsync -c "Remote connect User"
passwd remote
mkdir /home/remote
chown remote:remote /home/remote
echo "remote ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/remoteUser
passwd -d remote


#This has to happen locally.
ssh-copy-id -i ~/.ssh/remote remote@itClassroom17



Finished Computers



export ANSIBLE_HOST_KEY_CHECKING=False; ansible-playbook --ask-vault-pass provision.yml -i hosts


classroom Mac

sudo ether-wake c4:54:44:37:18:91 -i enp3s0


itClassroom01   c4:54:44:37:18:8d
itClassroom02   c4:54:44:37:18:84
itClassroom03   c4:54:44:37:18:1e
itClassroom04   c4:54:44:37:18:fc
itClassroom05   c4:54:44:37:18:64
itClassroom06   c4:54:44:37:18:1f
itClassroom07   c4:54:44:37:18:ce
itClassroom08   c4:54:44:37:18:c4
itClassroom09   c4:54:44:37:18:eb
itClassroom10   c4:54:44:37:18:f8
itClassroom11   c4:54:44:37:18:61 
itClassroom12   c4:54:44:63:50:cb
itClassroom13   c4:54:44:37:18:e6
itClassroom14   c4:54:44:37:18:38
itClassroom15   c4:54:44:37:18:ab
itClassroom16   c4:54:44:37:18:4b
itClassroom17   c4:54:44:37:18:91
itClassroom18


ifconfig
sudo ethtool -s eth0 wol g
sudo nano /etc/network/interfaces

# interfaces(5) file used by ifup(8) and ifdown(8)
auto lo
iface lo inet loopback
auto eth0
iface eth0 inet dhcp
post-up /sbin/ethtool -s eth0 wol g
post-down /sbin/ethtool -s eth0 wol g

sudo shutdown -h now && exit
