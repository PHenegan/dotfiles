{ config, lib, pkgs, ... }:
{
  imports = [ ../../shared/home/niri.nix ];

  home.file = {
    # TODO: This can be modular with a config specifying the background file string
    "config/niri/scripts/wallpaper.sh" = {
      executable = true;
      text = ''
      #!/bin/sh
      background_file=~/.dotfiles/assets/porygon-background.png
      swaybg -i $background_file -m fill
      '';
    };


    # NOTE: You cannot do ".source" directly because the whole config object
    # Must be overriden
    ".config/niri/device.kdl" = {
      source = ../config/niri/device.kdl;
    };

    # TODO: decide if this goes here or in home.nix
    "Pictures/Wallpapers/porygon-background.png".source = ../../assets/porygon-background.png;
    "Pictures/icons/bar-icon.png".source = ../../assets/icons/porygon.png;
  };
}
