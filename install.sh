#install function
function install(){
  sudo apt update && apt upgrade && sudo apt install xfce4 xfce4-goodies && sudo apt install tigervnc-standalone-server && vncserver && vncserver -kill :*;
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
  sudo ufw allow 5901 && sudo ufw enabled && sudo ufw reload && vncserver -localhost no :1;
  clear;
  
  echo "VNC installed successfuly !";
  echo "Coded by Mr9868";
  sleep 5
}
#end of install function

#chrome install function
function install_chrome(){
  apt install wget && wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb;
  sudo dpkg -i google-chrome-stable_current_amd64.deb && sudo apt-get install -f 
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

