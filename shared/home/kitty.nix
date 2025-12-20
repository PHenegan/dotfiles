{ config, lib, pkgs, ... }:
{
  home.file.".config/kitty" = {
    source = ../../config/kitty;
    recursive = true;
  };
}
