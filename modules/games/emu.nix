{ config, pkgs, unstable, ... }:

{
  environment.systemPackages = with pkgs [
    # unstable.yuzu-mainline # F in the chat Yuzu, you will be missed
    unstable.cemu
    dolphin-emu
  ];
}
