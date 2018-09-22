#!/bin/bash

basedir=$HOME/.spssh
installdir=/usr/local/bin

#Check if pssh is installed
dpkg -l | grep pssh &> /dev/null

if [ $? -ne 0 ]; then
  echo "[Error] pssh package needs to be installed"
  echo "Try: sudo apt-get install pssh"
  exit
fi

if [ -f $installdir/spssh ]; then
	echo "Removing old installation [OK]"
	echo "Your settings will be saved"
	sudo rm -r /usr/local/bin/spssh
fi

if [ ! -d ~/.spssh ]; then
	echo "Create directory $basedir [OK]"
	mkdir $basedir
	echo "Populating directory [OK]"
	echo "* Make sure to fill $basedir/hosts.txt with records"
	echo "* Each IP address should be in a separate line"
	touch $basedir/hosts.txt
fi

cp params $basedir/params
echo "Installing Simplified pssh under $installdir"
sudo cp spssh $installdir/spssh
sudo chmod +x $installdir/spssh && sudo chown $USER:$USER $installdir/spssh