#!/bin/bash



### Instalando programas y desistalando programas que vienen por defecto en kde
echo "Paso 2: Instalando Programas varios"

sudo apt install myspell-es vlc kleopatra keepassxc syncthing htop btop ufw fastfetch -y

##sudo apt remove kmahjongg kmines kpat firefox -y

## Instalar VSCodium

echo "Paso 3: Instalando VSCoidum"

wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg \
    | gpg --dearmor \
    | sudo dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg

    echo -e 'Types: deb\nURIs: https://download.vscodium.com/debs\nSuites: vscodium\nComponents: main\nArchitectures: amd64 arm64\nSigned-by: /usr/share/keyrings/vscodium-archive-keyring.gpg' \
       | sudo tee /etc/apt/sources.list.d/vscodium.sources


sudo apt update && sudo apt install codium -y

#### Instalar FLatpak y programas

echo "Paso 4: Añadiendo repositorio de flathub y descargando programas de flathub"

sudo apt install flatpak -y

 flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

 flatpak install flathub io.freetubeapp.FreeTube \
  org.localsend.localsend_app \
  io.missioncenter.MissionCenter \
  net.nokyan.Resources \
  com.github.johnfactotum.Foliate \
  com.github.tchx84.Flatseal \
  io.gitlab.librewolf-community \
  org.cryptomator.Cryptomator \
  org.mozilla.firefox -y

  ### Instalando brave

echo "Paso 5: Descargando Brave"

sudo apt install curl -y

sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

sudo curl -fsSLo /etc/apt/sources.list.d/brave-browser-release.sources https://brave-browser-apt-release.s3.brave.com/brave-browser.sources

sudo apt update

sudo apt install brave-browser -y

  ### Instalando VirtualBox

echo "Paso 6: Descargando VirtualBox para virtualización"

wget https://download.virtualbox.org/virtualbox/7.2.8/virtualbox-7.2_7.2.8-173730~Debian~trixie_amd64.deb

sudo dpkg -i virtual*.deb

sudo apt install -f -y

sudo dpkg -i virtual*.deb

sudo rm virtual*.deb

sudo apt install linux-headers-$(uname -r) gcc make -y 

sudo /sbin/vboxconfig

  ### Configurando cortafuegos

echo "Paso 7: Creación de reglas para el cortafuegos"

sudo systemctl enable --now ufw

sudo systemctl start ufw

sudo ufw enable

sudo ufw allow 53317/udp

sudo ufw allow 53317/tcp

#### Instalar paquete de colores en libreoffice (codehighlighter2)

echo "Paso 8: Descarga de paquete de libreoffice"

user=$(awk -F: '$3 == 1000 {print $1}' /etc/passwd)

wget https://extensions.libreoffice.org/assets/downloads/508/1735925190/codehighlighter2.oxt && mv codehighlighter2.oxt /home/$user/

#####################

### Instalando Mullvad VPN y Mullvad Browser

echo "Paso 1: Instalando Mullvad VPN y Mullvad Browser"

sudo curl -fsSLo /usr/share/keyrings/mullvad-keyring.asc https://repository.mullvad.net/deb/mullvad-keyring.asc

echo "deb [signed-by=/usr/share/keyrings/mullvad-keyring.asc arch=$( dpkg --print-architecture )] https://repository.mullvad.net/deb/stable stable main" | sudo tee /etc/apt/sources.list.d/mullvad.list

sudo apt update
sudo apt install mullvad-vpn mullvad-browser -y

######################


echo "Paso 11: Limpieza de paquetes"

sudo apt autoremove -y

echo "Final del Script!!!!!!, le recomendamos que reinice el equipo con el comando <sudo reboot>"

