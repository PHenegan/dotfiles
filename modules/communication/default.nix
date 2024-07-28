# Communication/Messaging Apps 
{ config, pkgs, unstable, ... }:

{
  environment.systemPackages = with pkgs; [
    discord armcord
    slack
    teams-for-linux
    element-desktop
    beeper
    zoom-us
  ];
}
