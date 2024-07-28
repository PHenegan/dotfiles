# Modules for hyprland desktop and some general programs I use for it

{ config, pkgs, unstable, ... }:

{
  programs.hyprland = {
    enable = true;
    package = unstable.hyprland;
    xwayland.enable = true;
  };

  fonts.packages = with pkgs; [
    font-awesome
  ];

  environment.systemPackages = with pkgs; [
    qt6.qtwayland
    materia-theme
    blueman
    networkmanagerapplet
    rofi-wayland
    unstable.waybar
    hyprpaper
    brightnessctl
    grim
    nwg-look
  ];
}
