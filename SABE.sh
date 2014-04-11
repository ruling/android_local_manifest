#!/bin/bash

export JOBS=`nproc`;

if [[ ${1} = "--auto" ]]; then
  export PARAM=-y
  export SKIP=1
else
  export PARAM=""
  export SKIP=0
fi

clear


if [ ${SKIP} = 1 ]; then
  echo "Unattended installation. skipping pause..."
else
  read -p "Press [Enter] key to continue..."
fi

clear

echo
echo "Entering SCRIPT FILE'S DOWNLOAD Directory"
echo
if [ ! -d ~/Downloads ]; then
  mkdir -p ~/Downloads
fi
cd ~/Downloads

if [ ${SKIP} = 1 ]; then
  echo "Unattended installation. skipping pause..."
else
  read -p "Press [Enter] key to continue..."
fi

clear

echo
echo "Installing Python!"
echo
sudo apt-get install build-essential gcc $PARAM
wget http://www.python.org/ftp/python/3.3.2/Python-3.3.2.tgz
tar -xvzf Python-3.3.2.tgz
cd ~/Downloads/Python-3.3.2
./configure --prefix=/usr/local/python3.3
make -j${JOBS}
sudo make install -j${JOBS}
sudo ln -s /usr/local/python3.3/bin/python /usr/bin/python3.3
cd ~/Downloads

if [ ${SKIP} = 1 ]; then
  echo "Unattended installation. skipping pause..."
else
  read -p "Press [Enter] key to continue..."
fi

clear

echo
echo "Installing CCache!"
echo
wget http://www.samba.org/ftp/ccache/ccache-3.1.9.tar.gz
tar -xvzf ccache-3.1.9.tar.gz
cd ~/Downloads/ccache-3.1.9
./configure
make -j${JOBS}
sudo make install -j${JOBS}
echo "export USE_CCACHE=1" >> ~/.bashrc
ccache -M 25G
cd ~/Downloads

if [ ${SKIP} = 1 ]; then
  echo "Unattended installation. skipping pause..."
else
  read -p "Press [Enter] key to continue..."
fi

clear

echo
echo "Installing GNU Make!"
echo
wget http://ftp.gnu.org/gnu/make/make-3.82.tar.gz
tar -xvzf make-3.82.tar.gz
cd ~/Downloads/make-3.82
./configure
sudo make install -j${JOBS}
cd ~/

if [ ${SKIP} = 1 ]; then
  echo "Unattended installation. skipping pause..."
else
  read -p "Press [Enter] key to continue..."
fi

clear

echo
echo "Installing JDK 6!"
echo
wget  --no-check-certificate --no-cookies --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com" "http://download.oracle.com/otn-pub/java/jdk/6u45-b06/jdk-6u45-linux-x64.bin"
sudo mv jdk-6u45-linux-x64.bin /usr/
cd /usr
sudo chmod 755 jdk-6u45-linux-x64.bin
sudo ./jdk-6u45-linux-x64.bin
echo -e '\n# Java\nexport JAVA_HOME=/usr/jdk1.6.0_45\nexport JRE_HOME=/usr/jdk1.6.0_45/jre\nexport PATH=$JAVA_HOME/bin:$JAVA_HOME/jre/bin:$PATH:$JAVA_HOME/bin\nexport CLASSPATH=./:$JAVA_HOME/lib:$JAVA_HOME/jre/lib' >> ~/.profile
cd ~/

if [ ${SKIP} = 1 ]; then
  echo "Unattended installation. skipping pause..."
else
  read -p "Press [Enter] key to continue..."
fi

clear

echo
echo "Installing Required Packages!"
echo
sudo apt-get install git-core gnupg flex bison gperf build-essential \
zip curl zlib1g-dev libc6-dev libncurses5-dev x11proto-core-dev \
libx11-dev libreadline6-dev libgl1-mesa-dev tofrodos python-markdown \
libxml2-utils xsltproc pngcrush gcc-multilib lib32z1 schedtool \
libqt4-dev lib32stdc++6 libx11-dev:i386 g++-multilib lib32z1-dev \
lib32ncurses5-dev ia32-libs mingw32 lib32z-dev

if [ ${SKIP} = 1 ]; then
  echo "Unattended installation. skipping pause..."
else
  read -p "Press [Enter] key to continue..."
fi

clear

echo
echo "Add  terminal to The mouse right button shortcut!"
echo
sudo apt-get install nautilus-open-terminal $PARAM
nautilus -q

echo
echo "Installing GIT!"
echo
sudo apt-get install git $PARAM

echo
echo "Installing Repo"
echo
if [ ! -d ~/bin ]; then
  mkdir -p ~/bin
fi
curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo

echo
echo "Installing ADB Drivers!"
echo
wget http://www.broodplank.net/51-android.rules
sudo mv -f 51-android.rules /etc/udev/rules.d/51-android.rules
sudo chmod 644 /etc/udev/rules.d/51-android.rules

if [ ${SKIP} = 1 ]; then
  echo "Unattended installation. skipping pause..."
else
  read -p "Press [Enter] key to continue..."
fi

clear

echo
echo "Downloading and Configuring Android SDK!!"
echo "Making sure unzip is installed"
echo
sudo apt-get install unzip $PARAM

if [ `getconf LONG_BIT` = "64" ]
then
        echo
        echo "Downloading SDK for 64bit Linux System"
        wget http://dl.google.com/android/adt/adt-bundle-linux-x86_64-20131030.zip
        echo "Download Complete!!"
        echo "Extracting"
	mkdir ~/adt-bundle
        mv adt-bundle-linux-x86_64-20131030.zip ~/adt-bundle/adt_x64.zip
        cd ~/adt-bundle
        unzip adt_x64.zip
        mv -f adt-bundle-linux-x86_64-20131030/* .
        echo "Configuring environment"
        echo -e '\n# Android tools\nexport PATH=${PATH}:~/adt-bundle/sdk/tools\nexport PATH=${PATH}:~/adt-bundle/sdk/platform-tools\nexport PATH=${PATH}:~/bin' >> ~/.bashrc
        echo -e '\nPATH="$HOME/adt-bundle/sdk/tools:$HOME/adt-bundle/sdk/platform-tools:$PATH"' >> ~/.profile
        echo "Placing desktop shortcuts"
        ln -s ~/adt-bundle/eclipse/eclipse ~/Desktop/Eclipse
        ln -s ~/adt-bundle/sdk/tools/android ~/Desktop/SDK-Manager
        echo "Done!!"
else

echo
        echo "Downloading SDK for 32bit Linux System"
        wget http://dl.google.com/android/adt/adt-bundle-linux-x86-20131030.zip
        echo "Download Complete!!"
        echo "Extracting"
        mkdir ~/adt-bundle
        mv adt-bundle-linux-x86-20131030.zip ~/adt-bundle/adt_x86.zip
        cd ~/adt-bundle
        unzip adt_x86.zip
        mv -f adt-bundle-linux-x86_64-20131030/* .
        echo "Configuring environment"
        echo -e '\n# Android tools\nexport PATH=${PATH}:~/adt-bundle/sdk/tools\nexport PATH=${PATH}:~/adt-bundle/sdk/platform-tools\nexport PATH=${PATH}:~/bin' >> ~/.bashrc
        echo -e '\nPATH="$HOME/adt-bundle/sdk/tools:$HOME/adt-bundle/sdk/platform-tools:$PATH"' >> ~/.profile
        echo "Placing desktop shortcuts"
        ln -s ~/adt-bundle/eclipse/eclipse ~/Desktop/Eclipse
        ln -s ~/adt-bundle/sdk/tools/android ~/Desktop/SDK-Manager
        echo "Done!!"
fi

if [ ${SKIP} = 1 ]; then
  echo "Unattended installation. skipping pause..."
else
  read -p "Press [Enter] key to continue..."
fi

clear

echo
echo "Cleaning up temporary files..."
echo
rm -f ~/Downloads/Python-3.3.2.tgz
sudo rm -rf ~/Downloads/Python-3.3.2
rm -f ~/Downloads/make-3.82.tar.gz
rm -Rf ~/Downloads/make-3.82
rm -f ~/jdk-6u45-linux-x64.bin
rm -f ~/Downloads/ccache-3.1.9.tar.gz
rm -Rf ~/Downloads/ccache-3.1.9
rm -Rf ~/adt-bundle/adt-bundle-linux-x86_64-20131030
rm -Rf ~/adt-bundle/adt-bundle-linux-x86-20131030
rm -f ~/adt-bundle/adt_x64.zip
rm -f ~/adt-bundle/adt_x86.zip

clear

echo
echo "Done!"
echo
echo "Cheers!"
echo
read -p "Press [Enter] key to exit..."
exit
