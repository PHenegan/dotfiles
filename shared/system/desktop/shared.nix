# Modules for general desktop environments which might not be included
# in barebones setups (like a tiling desktop environment)
{ config, pkgs, ... }:
{
  services.gvfs.enable = true;
  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [
      thunar-archive-plugin
      thunar-volman
    ];
  };

  environment.systemPackages = with pkgs; [
    # Settings/Managers
    blueman
    networkmanagerapplet
    brightnessctl
    pavucontrol
    flameshot

    # Tools / App Defaults
    rofi
    kdePackages.dolphin
    xarchiver # archiver
    kdePackages.ark # another archiver
    kdePackages.kate # GUI text editor
    kdePackages.gwenview # image viewer
    libsForQt5.qt5.qtwayland
    qt6.qtwayland

    # Themes
    dconf-editor # used to set GTK4 to prefer dark mode
    themechanger # honestly I have no clue when I should be using this vs. nwg-look
    nwg-look
    libsForQt5.qt5ct # Qt 5 theme manager
    qt6Packages.qt6ct # Qt 6 theme manager
    kdePackages.qtstyleplugin-kvantum
    materia-theme
    kdePackages.breeze
    kdePackages.breeze-gtk
    kdePackages.breeze-icons
  ];
}
