# Settings for working remotely
{ config, pkgs, zen-browser, ... }:
{
  environment.systemPackages = with pkgs; [
    citrix_workspace
  ];
}
