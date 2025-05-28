# Packages/settings for CS 4700 - Computer Networks
{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    wireshark
    dig
  ];
}
