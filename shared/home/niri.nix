{ config, lib, pkgs, ... }:
{
  imports = [./rofi.nix ./swaytools.nix ./waybar.nix ];

  home.file = {
    ".config/niri/config.kdl" = lib.mkDefault {
      source = ../../config/niri/config.kdl;
    };
    ".config/niri/environment.kdl" = lib.mkDefault {
      source = ../../config/niri/environment.kdl;
    };
    ".config/niri/theming.kdl" = lib.mkDefault {
      source = ../../config/niri/theming.kdl;
    };
    ".config/niri/device.kdl" = lib.mkDefault {
      source = ../../config/niri/device.kdl;
    };

    # Individually source script files so they can be easily overriden
    ".config/niri/scripts/get_node_id.sh" = lib.mkDefault {
      source = ../../config/niri/scripts/get_node_id.sh;
      executable = true;
    };
    ".config/niri/scripts/toggle_mute.sh" = lib.mkDefault {
      source = ../../config/niri/scripts/toggle_mute.sh;
      executable = true;
    };
    ".config/niri/scripts/wallpaper.sh" = lib.mkDefault {
      source = ../../config/niri/scripts/wallpaper.sh;
      executable = true;
    };

    ".config/niri/resources" = {
      source = ../../config/niri/resources;
      recursive = true;
    };
  };
}
