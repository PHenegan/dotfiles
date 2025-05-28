# Packages for CY 3740 - Systems Security
{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    burpsuite
    ghidra
  ];
}
