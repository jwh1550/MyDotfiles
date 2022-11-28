#!/bin/bash

cd ~/

echo "Enter Your Host Name(PC Name):"

read HostName

hostnamectl set-hostname $HostName

echo 'fastestmirror=1' | sudo tee -a /etc/dnf/dnf.conf
echo 'max_parallel_downloads=20' | sudo tee -a /etc/dnf/dnf.conf
echo 'deltarpm=true' | sudo tee -a /etc/dnf/dnf.conf

echo "Updating the System."

sleep 5
sudo dnf update
sudo dnf upgrade -y --refresh
sudo dnf check
sudo dnf autoremove
sudo fwupdmgr get-devices
sudo fwupdmgr refresh --force
sudo fwupdmgr get-updates
sudo fwupdmgr update

echo "Adding rpmfusion."

sudo dnf install -y  https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

sudo dnf upgrade -y --refresh
sudo dnf groupupdate core
sudo dnf install -y rpmfusion-free-release-tainted
sudo dnf install -y dnf-plugins-core util-linux-user
sudo dnf groupinstall -y "Development Tools" "Development Libraries"
sudo dnf install util-linux-user -y


## Install rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --default-toolchain none -y


flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak update

## vim
sudo dnf install vim -y

## VS Code
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc && \
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo' && \
sudo dnf check-update && \
sudo dnf install code -y


## google chrome
sudo dnf install fedora-workstation-repositories -y && \
sudo dnf config-manager --set-enabled google-chrome && \
sudo dnf install google-chrome-stable -y

# Node.js
curl -fsSL https://rpm.nodesource.com/setup_16.x | sudo bash -
sudo dnf install -y nodejs

## Fira Code Font
sudo dnf install fira-code-fonts
sleep 5
## Toools to compile alacritty
sudo dnf install cmake freetype-devel fontconfig-devel libxcb-devel libxkbcommon-devel g++
sleep 5
## Install Alacritty
cargo install alacritty
sleep 5
## Install Nushell
cargo install nu --features=extra
sleep 5
## Install xh httpie
cargo install xh
sleep 5
## Install Starship
curl -sS https://starship.rs/install.sh | sh
sleep 5
## Install bat
cargo install --locked bat
sleep 5
## install lapce
sudo dnf copr enable titaniumtown/lapce -y
sudo dnf install lapce -y 
sleep 5
## Install exa
cargo install exa
sleep 5
## Instsall rip -- replacement for rm
cargo install rm-improved
sleep 5
## Install xcp -- faster and safer than cp
cargo install xcp
sleep 5
## Install zoxide
cargo install zoxide --locked
sleep 5
## install dust -- alternative for du command
cargo install du-dust
sleep 5
## replacement for grep
cargo install ripgrep
sleep 5
## Install fd - simpler than find
cargo install fd-find
sleep 5
## install sd - find and replace 
cargo install sd
sleep 5
## install procs -- ps replacement
cargo install procs
sleep 5
#Broot is a tree alternative with a better user experience, and you can use it to navigate a file structure. It’s fast and respects 
cargo install broot --locked
sleep 5
## Keep system uptodate
cargo install topgrade --locked
sleep 5
## replacement for top
cargo install bottom --locked
sleep 5
cargo install deno
sleep 5

cargo install deno --locked

sudo dnf install openssl


sudo dnf copr enable kwizart/fedy
sudo dnf install fedy -y

sudo dnf install gnome-tweaks -y

sudo dnf install gnome-extensions-app -y


sudo dnf install fzf -y
cargo install --locked navi


curl 'https://dotnet.microsoft.com/download/dotnet/scripts/v1/dotnet-install.sh' -H
sudo chmod +x ./dotnet-install.sh

./dotnet-install.sh --version latest

cargo install onefetch

sudo dnf update 
sudo dnf upgrade -y --refresh
sudo dnf autoremove
#sudo reboot now 

#firewall-config
