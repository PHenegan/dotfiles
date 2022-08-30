pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..

# Will simplify installation so chromium doesn't need to be compiled
yay -S electron-bin
yay -S --needed python python-pip \
                jre11-openjdk jre8-openjdk jre-openjdk \
                nano vim \
                firefox brave-bin \
                discord \
                zoom \
                teams \
                neofetch \
                htop \
                balena-etcher \
                libmtp \
                flatpak \
                reflector reflector-simple \
                ttf-liberation noto-fonts noto-fonts-emoji \
                speedtest-cli
