{config, lib, pkgs, ...}:
{
  imports = [ ../../shared/home/niri.nix ];

  home.file.".config/niri/scripts/wallpaper.sh" = {
    executable = true;
    text = ''
      #!/bin/sh
      background_file=~/Pictures/Wallpapers/rainbow-cat.png
      swaybg -i $background_file -m fill
    '';
  };

  home.file.".config/niri/device.kdl" = {
    source = ./config/niri/device.kdl;
  }
}
