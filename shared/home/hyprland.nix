{ config, lib, pkgs, ... }:
{
  # Hyprland config also depends on waybar and rofi

  imports = [./waybar.nix ./rofi.nix];
  home.file.".config/hypr" = {
    source = ../../config/hypr;
    recursive = true;
  };

  home.file.".config/hypr/scripts/" = {
    source = ../../config/hypr/scripts;
    recursive = true;
    executable = true;
  };
}
