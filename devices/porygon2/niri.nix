{ config, lib, pkgs, ... }:
{
  imports = [ ../../shared/home/niri.nix ];

  home.file.".config/niri/scripts/wallpaper.sh" = {
    executable = true;
    text = ''
      #!/bin/sh
      background_file=~/.dotfiles/assets/porygon-background.png
      swaybg -i $background_file -m fill
    '';
  };

  home.file.".config/niri/scripts/audio_devices.sh" = {
    text = ''
      #!/bin/sh
      sleep 2 && noisetorch -i -s alsa_input.usb-MV-SILICON_fifine_Microphone_20190808-00.analog-stereo -t 80
    '';
    executable = true;
  };

  # NOTE: You cannot do ".source" directly because the whole config object
  # Must be overriden
  home.file.".config/niri/device.kdl" = {
    source = ../config/niri/device.kdl;
  };
}
