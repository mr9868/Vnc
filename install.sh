sudo apt update && sudo apt install xfce4 xfce4-goodies && sudo apt install tigervnc-standalone-server && vncserver && vncserver -kill :1;
cat << EOF > ~/.vnc/xstartup
#!/bin/sh

# Start up the standard system desktop
unset SESSION_MANAGER
unset DBUS_SESSION_BUS_ADDRESS

/usr/bin/startxfce4

[ -x /etc/vnc/xstartup ] && exec /etc/vnc/xstartup
[ -r $HOME/.Xresources ] && xrdb $HOME/.Xresources
x-window-manager &
EOF

chmod +x ~/.vnc/xstartup;
sudo ufw allow 5901 && sudo ufw reload && vncserver;

