{ config, lib, pkgs, ... }:
{
  # Hyprland config also depends on waybar and rofi

  imports = [./rofi.nix];
  home.file.".config/hypr" = {
    source = ../../config/hypr;
    recursive = true;
  };

  home.file.".config/hypr/scripts/" = {
    source = ../../config/hypr/scripts;
    recursive = true;
    executable = true;
  };

  # Use hyprland-specific waybar folder
  home.file.".config/waybar" = {
    source = ../../config/waybar.hyprland;
    recursive = true;
  };
}
