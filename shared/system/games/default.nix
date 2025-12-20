{ config, pkgs, ... }:
{
  imports = [ ./lightemu.nix ];

  programs.steam.enable = true;

  environment.systemPackages = with pkgs; [
    heroic
    prismlauncher
  ];
}
