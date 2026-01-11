{ config, lib, pkgs, ... }:
{
  home.file.".config/swaylock/config" = lib.mkDefault {
    source = ../../config/swaylock/config;
  };
}
