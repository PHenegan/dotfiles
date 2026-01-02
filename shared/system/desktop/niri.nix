# Module for Niri scrollable tiling compositor
{ config, pkgs, ... }:
{
  # Shared programs useful for any window manager
  imports = [ ./shared.nix ];

  # Use SDDM for managing login
  services.displayManager.sddm = {
    enable = true;
    theme = "catppuccin-macchiato-lavender";
    package = pkgs.kdePackages.sddm;
  };

  programs.niri = {
    enable = true;
    useNautilus = false;
  };

  # Niri uses gnome keyring for GUI apps which require root privileges
  services.gnome.gnome-keyring.enable = true;
  security.polkit.enable = true;

  fonts.packages = with pkgs; [
    noto-fonts
    font-awesome
    nerd-fonts.jetbrains-mono
  ];

  # Other programs which are specific to Niri
  environment.systemPackages = with pkgs; [
    xwayland-satellite
    mako
    waybar
    kdePackages.polkit-kde-agent-1
    swaybg
    swaylock
    swayidle

    # Override for SDDM theme
    (catppuccin-sddm.override {
      flavor = "macchiato";
      accent = "lavender";
      font = "Noto Sans Light";
      fontSize = "18";
    })
  ];
}
