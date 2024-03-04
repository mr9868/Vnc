sudo apt update && sudo apt purge xfce4 xfce4-goodies && sudo apt purge tigervnc-standalone-server && vncserver -kill :1 && rm -rf ~/.vnc/xstartup;
rm -rf /etc/vnc;
rm -rf $HOME/.Xresources;
sudo ufw deny 5901 && sudo ufw enabled && sudo ufw reload;
echo "Vnc removed successfuly !"
sleep 5;
