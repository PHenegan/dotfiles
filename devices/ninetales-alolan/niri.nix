{ config, lib, pkgs, ... }:
{
  imports = [ ../../shared/home/niri.nix ];

  home.file = {
    ".config/niri/scripts/wallpaper.sh" = {
      executable = true;
      text = ''
        #!/bin/sh
        background_file=~/Pictures/Wallpapers/ninetales-alolan.jpg
        swaybg -i $background_file -m fill
      '';
    };
    ".config/niri/device.kdl" = {
      source = ./config/niri/device.kdl;
    };

    "Pictures/Wallpapers/ninetales-alolan.jpg" = {
      source = ../../assets/ninetales-alolan.jpg;
    };
    "Pictures/icons/bar-icon.png" = {
      source = ../../assets/icons/ninetales-alolan.png;
    };
  };
}
