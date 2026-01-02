{ config, lib, pkgs, ... }:
{
  # Hyprland config also depends on waybar and rofi

  imports = [./rofi.nix];

  home.file.".config/hypr/device.conf".source = ../../config/hypr/device.conf;
  home.file.".config/hypr/general-keybinds.conf".source = ../../config/hypr/general-keybinds.conf;
  home.file.".config/hypr/hyprland.conf".source = ../../config/hypr/hyprland.conf;
  home.file.".config/hypr/hyprpaper.conf".source = ../../config/hypr/hyprpaper.conf;

  # Wallapers and Assets
  home.file.".config/hypr/resources" = {
    source = ../../config/hypr/resources;
    recursive = true;
  };
  home.file.".config/hypr/wallpapers" = {
    source = ../../config/hypr/wallpapers;
    recursive = true;
  };

  # Scripts
  home.file.".config/hypr/scripts/audio_devices.sh" = {
    source = ../../config/hypr/scripts/audio_devices.sh;
    executable = true;
  };
  home.file.".config/hypr/scripts/get_node_id.sh" = {
    source = ../../config/hypr/scripts/get_node_id.sh;
    executable = true;
  };
  home.file.".config/hypr/scripts/toggle_mute.sh" = {
    source = ../../config/hypr/scripts/toggle_mute.sh;
    executable = true;
  };

  # Use hyprland-specific waybar folder
  home.file.".config/waybar" = {
    source = ../../config/waybar.hyprland;
    recursive = true;
  };
}
