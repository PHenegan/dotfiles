{ config, lib, pkgs, ... }:
{
  # Hyprland config also depends on waybar and rofi

  imports = [./waybar.nix ./rofi.nix];


  # NOTE - I am intentionally not managing hyprland directly through home manager
  # because I want this config to be portable across distros

  # NOTE - `hyprpaper.conf` and `hardware.conf` can be overriden with device-specific themes or settings
  # using Nix's priority settings

  # General config files
  home.file.".config/hypr/hyprland.conf" = {
    source = ../config/hypr/hyprland.conf;
  };

  home.file.".config/hypr/hyprpaper.conf" = {
    source = ../config/hypr/hyprpaper.conf;
  };

  home.file.".config/hypr/keybinds.conf" = {
    source = ../config/hypr/keybinds.conf;
  };

  home.file.".config/hypr/hardware.conf" = {
    source = ../config/hypr/hardware.conf;
  };

  # Extra folders
  home.file.".config/hypr/wallpapers/" = {
    source = ../config/hypr/wallpapers;
    recursive = true;
  };

  home.file.".config/hypr/resources/" = {
    source = ../config/hypr/resources;
    recursive = true;
  };

  home.file.".config/hypr/scripts/" = {
    source = ../config/hypr/scripts;
    recursive = true;
    executable = true;
  };
}
