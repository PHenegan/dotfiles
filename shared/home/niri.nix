{ config, lib, pkgs, ... }:
{
  imports = [./rofi.nix ./waybar.nix ];
  home.file.".config/niri" = {
    source = ../../config/niri;
    recursive = true;
  };

  home.file.".config/niri/scripts/" = {
    source = ../../config/niri/scripts;
    recursive = true;
    executable = true;
  };
}
