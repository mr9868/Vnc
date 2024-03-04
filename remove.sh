function remove() {
sudo apt update && sudo apt purge xfce4 xfce4-goodies && sudo apt purge tigervnc-standalone-server && vncserver -kill :* && rm -rf ~/.vnc/xstartup;
rm -rf /etc/vnc;
rm -rf $HOME/.Xresources;
sudo ufw deny 5901 && sudo ufw enabled && sudo ufw reload;
echo "Vnc removed successfuly !"
sleep 2
}

#chrome remove function
function remove_chrome() {
  sudo apt-get purge google-chrome-stable && rm -rf ~/.config/google-chrome/ &&  sudo apt-get update;
  echo "Chrome has successfuly removed !"
  sleep 5
}
#end of chrome remove function

#prompt for remove google chrome
function chrome_prompt() {
REQUIRED_PKG="chrome"
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' $REQUIRED_PKG|grep "install ok installed")
echo Checking for $REQUIRED_PKG: $PKG_OK
if [ "" = "$PKG_OK" ]; then
  echo "Removed successfuly !"
  sleep 5;
else
      
      printf 'Do you want to remove chrome to your machine (y/n)? '
        read answer
        if [ "$answer" != "${answer#[Yy]}" ] ;then 
            remove_chrome; 
        else
            clear;
            echo "Chrome remove rejected !"
            sleep 5
        fi
      sleep 5
fi
  
}
#end of chrome remove prompt


printf 'Do you want to remove vnc from your machine (y/n)? '
read answer
if [ "$answer" != "${answer#[Yy]}" ] ;then 
    remove;
    chrome_prompt;
else
    clear;
    echo "Nice !"
    sleep 5
fi
