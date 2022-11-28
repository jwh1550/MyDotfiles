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

curl -L https://install.meilisearch.com | sh

cargo install cargo-web
cargo web build
#cargo web start



rustup target add wasm32-unknown-unknown
cargo install --locked trunk
cargo install trunk wasm-bindgen-cli
cargo install wasm-pack
wasm-pack build --target web


cargo install wasm-pack
cargo install basic-http-server

cargo install basic-http-server

## To build  rust-yew-realworld-example-app
## From here 
cargo install tauri-cli
cargo tauri dev
cargo tauri build

npx create-yew-app my-app
cd my-app
npm start
##
## To here

#  Fast, lightweight & schema-less search backend. An alternative to Elasticsearch that runs on a few MBs of RAM.
cargo install sonic-server

# ls replacement
cargo install lsd##

#A fast static site generator in a single binary with everything built-in. https://www.getzola.org
sudo dnf install zola -y

# Blazing boom fast terminal-ui for git written in rust crab
cargo install gitui


# Terminal bandwidth utilization tool 
cargo install bandwhich

# https://github.com/Byron/gitoxide
# The default installation, 'max'
cargo install gitoxide

# For smaller binaries and even faster build times that are traded for a less fancy CLI implementation, use `lean`
# or `lean-termion` respectively.
cargo install gitoxide --no-default-features --features lean

# Follow with this one
cargo install --git https://github.com/Byron/gitoxide  gitoxide

# https://github.com/libreddit/libreddit
# Private front-end for Reddit 
cargo install libreddit


# Serenity discord bot
cargo-make
Install cargo-make cargo install --force cargo-make
git clone https://github.com/serenity-rs/serenity.git
cd serenity
cargo make 1

# https://github.com/jameslittle230/stork
# mag_right Impossibly fast web search, made for static sites. 
cargo install stork-search --locked



# https://github.com/tinysearch/tinysearch
# mag Tiny, full-text search engine for static websites built with Rust and Wasm 
cargo install tinysearch

sudo dnf update 
sudo dnf upgrade -y --refresh
sudo dnf clean dbcache
sudo dnf clean all
#sudo reboot now 

#firewall-config


# Still repos under 1k stars
# repos
