{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs [
    # unstable.yuzu-mainline # F in the chat Yuzu, you will be missed
    # TODO: Find a way to get a yuzu or ryujinx fork in here
    cemu
    dolphin-emu
  ];
}
