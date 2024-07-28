 # CLI Utilities
{ config, pkgs, unstable, ... }:
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

    # Miscellaneous GUI apps
    obsidian
    xournalpp
    popsicle
    
    # Media
    vivaldi
    vivaldi-ffmpeg-codecs
    vlc
    helvum 
    easyeffects
    obs-studio # TODO - maybe put this in a separate file
    # with like GIMP, Krita, and audacity or something

    # android
    android-tools
    mtpfs
  ];
}
