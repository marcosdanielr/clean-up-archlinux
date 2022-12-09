!/bin/bash

echo "#### THIS SCRIPT WILL CLEANUP YOUR ARCHLINUX ####"

 #echo "List packages"
 #ls /var/cache/pacman/pkg/ | less 

echo "Type 1 to remove all pkg except those installed or type 2 to remove all files"
read num

if [[ ($num == "1") ]];  then
  echo "pacman -Sc will run"
  sudo pacman -Sc 
else
  echo "pacman -Scc will run"
  sudo pacman -Scc
fi

#=====================================#

echo "This are unused packages:"
sudo pacman -Qtdq

echo "Do you want to remove them? Type 'y' for yes or 'n' for 'not'"
read permission

if [[ ($permission == "y") ]]; then
  echo "pacman -R (pacman -Qtdq) will run"
  sudo pacman -R $(pacman -Qtdq)
fi

if [[ ($permission == "n") ]]; then
  echo "Operation denied"
fi 


