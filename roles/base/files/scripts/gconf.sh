### Gconftool settings
# Adjust terminal Settings
gconftool-2 --type bool --set /apps/gnome-terminal/profiles/Default/use_system_font False
gconftool-2 --type bool --set /apps/gnome-terminal/profiles/Default/use_theme_colors False
gconftool-2 --type bool --set /apps/gnome-terminal/profiles/Default/scrollback_unlimited True
gconftool-2 --type bool --set /apps/gnome-terminal/profiles/Default/default_show_menubar False
gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/font "Droid Sans Mono 8"
gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/scrollbar_position "hidden"
gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/background_type "transparent"
gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/foreground_color "white"
gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/background_color "black"
### Adjust screensaver settings
gconftool-2 --type bool --set /org/gnome/desktop/screensaver/lock-enabled False
gconftool-2 --type integer --set /org/gnome/desktop/screensaver/lock-delay 0
gconftool-2 --type integer --set /org/gnome/desktop/screensaver/ubuntu-lock-on-suppend False

gconftool-2 --type integer --set /org/gnome/desktop/session/idle-delay 300
gconftool-2 --type bool --set /org/gnome/desktop/screensaver/idle-activation-enabled True

### Adjust Wallpaper Settings
#gconftool-2 --type string --set /org/gnome/desktop/background/picture-uri "file:///usr/share/backgrounds/publicClassroom.jpg"


#Trying it with gsettings
gsettings set org.gnome.desktop.background picture-uri file:///usr/share/backgrounds/publicClassroom.jpg
gsettings set org.gnome.desktop.screensaver lock-delay 0
