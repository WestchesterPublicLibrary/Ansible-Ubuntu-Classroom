#!/bin/bash

#This needs to be run as the root user
if [[ $UID -ne 0 ]]; then
	echo "$0 must be run as root"
	exit 1
fi

#Workstation
dnf install --nogpgcheck http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

dnf install \
	yum-plugin-fastestmirror nano \
	levien-inconsolata-fonts adobe-source-code-pro-fonts \
	mozilla-fira-mono-fonts google-droid-sans-mono-fonts \
	openssh filezilla python xclip inotify-tools \
	npm which make vagrant xbindkeys xautomation \
	solaar parallel vlc screenfetch fslint powerline \
	tmux-powerline wget p7zip expect



#this is for Nvidia Only
NVIDIA=$(lspci | grep -i "VGA" | grep -i "NVIDIA2")
NVIDIAsize=${#NVIDIA} 
if [ $NVIDIAsize -eq 0 ]; then
	echo "no nvidia"
else
	echo "THERE IS NVIDIA"
	dnf config-manager --add-repo=http://negativo17.org/repos/fedora-nvidia.repo
	dnf config-manager --add-repo=http://negativo17.org/repos/fedora-handbrake.repo
	dnf install -y nvidia-driver akmod-nvidia kernel-devel nvidia-driver-libs.i686 \
	cuda nvidia-driver-cuda cuda-devel nvidia-driver-NVML-devel
fi

#gnome 3 Only
#dnf install gnome-tweak-tool -y

mkdir -p ~/.config/systemd/user/
cp gnome-background-change.* ~/.config/systemd/user/

systemctl --user enable gnome-background-change.timer
systemctl --user start gnome-background-change.timer




#Install Fedy
#This is very optional and will help with the setup. All of this can be done manualy but this makes it easy
curl http://folkswithhats.org/fedy-installer -o fedy-installer && chmod +x fedy-installer && ./fedy-installer

#just check this
