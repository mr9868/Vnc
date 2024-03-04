function remove() {
sudo apt update && sudo apt purge xfce4 xfce4-goodies && sudo apt purge tigervnc-standalone-server && vncserver -kill :* && rm -rf ~/.vnc/xstartup;
rm -rf /etc/vnc;
rm -rf $HOME/.Xresources;
sudo ufw deny 5901 && sudo ufw enabled && sudo ufw reload;
echo "Vnc removed successfuly !"
sleep 10
}
printf 'Do you want to remove vnc from your machine (y/n)? '
read answer
if [ "$answer" != "${answer#[Yy]}" ] ;then 
    remove;
else
    echo "Nice !"
fi
