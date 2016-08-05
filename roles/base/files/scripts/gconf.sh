### Gconftool settings
# Adjust terminal Settings
gconftool-2 --type boolean --set /apps/gnome-terminal/profiles/Default/use_system_font false
gconftool-2 --type boolean --set /apps/gnome-terminal/profiles/Default/use_theme_colors false
gconftool-2 --type boolean --set /apps/gnome-terminal/profiles/Default/scrollback_unlimited true
gconftool-2 --type boolean --set /apps/gnome-terminal/profiles/Default/default_show_menubar false
gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/font "Hack Regular 10"
gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/scrollbar_position "hidden"
gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/background_type "transparent"
gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/foreground_color "white"
gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/background_color "black"

gconftool-2 --type boolean --set /con/cononical/unity/integrated-menus true
gconftool-2 --type as --set /com/cononical/unity/webapps []

### Adjust screensaver settings
gconftool-2 --type boolean --set /org/gnome/desktop/screensaver/lock-enabled false
gconftool-2 --type integer --set /org/gnome/desktop/screensaver/lock-delay 0
gconftool-2 --type boolean --set /org/gnome/desktop/screensaver/ubuntu-lock-on-suppend false

gconftool-2 --type integer --set /org/gnome/desktop/session/idle-delay 300
gconftool-2 --type boolean --set /org/gnome/desktop/screensaver/idle-activation-enabled true

### Adjust Wallpaper Settings

#gconftool-2 --type string --set /org/gnome/desktop/background/picture-uri "file:///usr/share/backgrounds/publicClassroom.jpg"


#Trying it with gsettings
gsettings set org.gnome.desktop.background picture-uri file:///usr/share/backgrounds/publicClassroom.jpg
gsettings set org.gnome.desktop.screensaver lock-delay 0

gconftool-2 --type string --set /org/gnome/desktop/interface/monospace-font-name 'Hack Regular 12'
gconftool-2 --type string --set /org/gnome/nautilus/desktop/font 'Ubuntu 10'
