SERVER_IP=$(curl -w '\n' ifconfig.me);
#install function
function install(){
  sudo apt update && sudo apt upgrade && sudo apt install xfce4 xfce4-goodies && sudo apt install tigervnc-standalone-server && sudo vncserver && sudo vncserver -kill :* && sudo echo "#!/bin/sh
      
      # Start up the standard system desktop
      unset SESSION_MANAGER
      unset DBUS_SESSION_BUS_ADDRESS
      
      /usr/bin/startxfce4
      
      [ -x /etc/vnc/xstartup ] && exec /etc/vnc/xstartup
      [ -r $HOME/.Xresources ] && xrdb $HOME/.Xresources
      x-window-manager &" >> ~/.vnc/xstartup && sudo chmod +x ~/.vnc/xstartup && sudo ufw allow 5901 && sudo ufw enable && sudo ufw reload && sudo vncserver -localhost no :1 && clear;

  echo "Download your VNC client on : https://www.realvnc.com/en/connect/download/viewer";
  echo "Put '${SERVER_IP}:5901' to connect the VNC";
  echo "VNC installed successfuly !";
  echo "Coded by Mr9868";
  sleep 5
}
#end of install function

#chrome install function
function install_chrome(){
  sudo apt install wget && sudo wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb;
  sudo dpkg -i google-chrome-stable_current_amd64.deb && sudo apt-get install -f && sudo apt --fix-broken install
  echo "Chrome has successfuly installed !"
  sleep 5
}
#end of chrome install function

#prompt for install google chrome
function chrome_prompt(){
  printf 'Do you want to install chrome to your machine (y/n)? '
    read answer
  if [ "$answer" != "${answer#[Yy]}" ] ;then 
      install_chrome; 
  else
      clear;
      echo "Chrome install rejected !"
      sleep 5
  fi
}
#end of chrome installation prompt

#prompt for install
printf 'Do you want to install vnc to your machine (y/n)? '
  read answer
  if [ "$answer" != "${answer#[Yy]}" ] ;then 
      install && chrome_prompt;
  else
      clear;
      echo "See you later !";
      sleep 5
  fi
#end of install prompt

