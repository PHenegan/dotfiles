# Communication/Messaging Apps 
{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    discord legcord
    slack
    teams-for-linux
    element-desktop
    beeper
    zoom-us
  ];
}
