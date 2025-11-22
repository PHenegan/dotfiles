# Modules for hyprland desktop and some general programs I use for it

# NOTE ON THEMES
# - Some of the catppuccin themes need to be manually installed - i.e. kvantum and qt5/6 schemes
# - if GTK breaks try messing with dconf since that is the most manual way to do it

{ config, pkgs, ... }:

{
  services.displayManager.sddm = {
    enable = true;
    theme = "catppuccin-macchiato-lavender";
    package = pkgs.kdePackages.sddm;
  };
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  fonts.packages = with pkgs; [
    noto-fonts
    font-awesome
    nerd-fonts.jetbrains-mono
  ];

  services.gvfs.enable = true;
  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [
      thunar-archive-plugin
        thunar-volman
    ];
  };

  environment.systemPackages = with pkgs; [
    # Misc programs
    hyprland-qt-support
    hyprpolkitagent
    libsForQt5.qt5.qtwayland
    qt6.qtwayland
    hyprpaper
    waybar
    rofi
    grim

    # Tools / App Defaults
    kdePackages.dolphin
    xarchiver # archiver
    kdePackages.ark # another archiver
    kdePackages.kate # GUI text editor
    kdePackages.gwenview # image viewer

    # Settings/Managers
    blueman
    networkmanagerapplet
    brightnessctl
    pavucontrol
    flameshot

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
    (catppuccin-sddm.override {
      flavor = "macchiato";
      accent = "lavender";
      font = "Noto Sans Light";
      fontSize = "18";
    })
  ];
}
