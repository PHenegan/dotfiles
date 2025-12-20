{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs [
    # unstable.yuzu-mainline # F in the chat Yuzu, you will be missed
    cemu
    dolphin-emu
  ];
}
