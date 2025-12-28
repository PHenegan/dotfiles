# Modules for hyprland desktop and some general programs I use for it

# NOTE ON THEMES
# - Some of the catppuccin themes need to be manually installed - i.e. kvantum and qt5/6 schemes
# - if GTK breaks try messing with dconf since that is the most manual way to do it

{ config, pkgs, ... }:

{
  imports = [ ./shared.nix ];

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

  environment.systemPackages = with pkgs; [
    # Misc programs
    hyprland-qt-support
    hyprpolkitagent
    hyprpaper
    waybar
    grim

    # Themes
    (catppuccin-sddm.override {
      flavor = "macchiato";
      accent = "lavender";
      font = "Noto Sans Light";
      fontSize = "18";
    })
  ];
}
