# Plugins and settings for neovim
{ config, pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    configure = {
      customRC = ''
        source ~/.config/nvim/init.lua
      '';
    };
  };
}
