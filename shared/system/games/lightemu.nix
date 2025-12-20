# Emulators that are light enough to run reasonably on a laptop
{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    mgba
    melonDS
    # citra-canary # F in the chat citra, you will be missed
  ];
}
