# Home-manager managing of waybar dotfiles
{ config, lib, pkgs, ... }:
{
  home.file.".config/waybar" = {
    source = ../../config/waybar;
    recursive = true;
  };
}
