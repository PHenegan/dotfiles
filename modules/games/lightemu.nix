# Emulators that are light enough to run reasonably on a laptop
{ config, pkgs, unstable, ... }:
{
  environment.systemPackages = with unstable; [
    mgba
    melonDS
    # citra-canary # F in the chat citra, you will be missed
  ];
}
