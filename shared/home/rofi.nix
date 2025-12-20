# Home-manager managing of rofi dotfiles
{ config, lib, pkgs, ... }:
{
  home.file.".config/rofi" = {
    source = ../../config/rofi;
    recursive = true;
  };
}
