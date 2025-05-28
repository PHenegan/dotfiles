 # CLI Utilities
{ config, pkgs, zen-browser, ... }:
{
  services.flatpak.enable = true;

  virtualisation.podman.enable = true;
  
  programs.noisetorch.enable = true;

  environment.systemPackages = with pkgs; [
    # CLI Tools
    vim
    zip unzip
    pciutils
    wget
    distrobox
    htop
    kitty
    pwgen
    speedtest-cli
    tigervnc
    neofetch
    ripgrep
    jq
    wireguard-tools
    killall
    yt-dlp

    # Miscellaneous GUI apps
    obsidian
    xournalpp
    popsicle
    protonvpn-gui
    
    # Media
    vivaldi
    vivaldi-ffmpeg-codecs
    firefox
    zen-browser.default
    libreoffice
    vlc
    helvum 
    easyeffects
    stremio
    obs-studio # TODO - maybe put this in a separate file
    gimp
    # with like GIMP, Krita, and audacity or something

    # android
    android-tools
    mtpfs
  ];
}
