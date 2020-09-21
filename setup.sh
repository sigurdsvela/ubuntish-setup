# Essentials

# printf "\n\n\n$USER ALL=(ALL) NOPASSWD:ALL\n" | sudo tee -a /etc/sudoers

## --- pip3 git add-apt-repository
echo "Installing basics"
echo "- git"
sudo apt install git -y &> /dev/null

git config --global user.email "sigurdbergsvela@gmail.com"
git config --global user.name "Sigurd Berg Svela"

echo "- apt-utils"
sudo apt install apt-utils -y &> /dev/null
echo "- python3"
sudo apt install python3-pip -y &> /dev/null
echo "- software-properties-common"
sudo apt install software-properties-common -y &> /dev/null
echo "- vim"
sudo apt install vim -y &> /dev/null
## --- Add 32bit
sudo dpkg --add-architecture i386


echo "Sensors setup"
sudo ./sensors/setup.sh

echo "Keyboard Setup"
sudo ./keyboard/setup.sh

echo "Dotfile Setup"
sudo ./dotfiles/setup.sh


## ---- Snaps
echo "Installing snaps..."
echo "- Install snapd"
sudo apt install snapd -y > /dev/null
echo "- Install spotify"
snap install spotify > /dev/null
echo "- Install vscode"
snap install --classic code > /dev/null
echo "- Install deja-dub"
snap install --classic deja-dup > /dev/null
printf "\nexport PATH=\$PATH:/snap/bin\n"

## ---- Dropbox
echo "Installing Dropbox"
sudo apt install ./dist/dropbox.deb -y

## Install apts
./apt-installer/install.sh ./apt


ssh-keygen
sudo systemctl enable ssh
sudo service ssh start
