# Home-manager modules for Bash

{ config, lib, pkgs, ...}:

{
  programs.bash = {
    enable = true;
    shellAliases = {
      # I don't actually know if the quotations work correctly
      rebuild = "sudo nixos-rebuild switch --flake ~/.dotfiles/";
      rebuild-home = "home-manager switch --flake ~/.dotfiles/";
      clean-system = "sudo nix-collect-garbage -d";
      clean-home = "nix-collect-garbage -d";
    };
    initExtra = ''
      # Created by `pipx` on 2023-12-12 00:14:12
      export PATH="$PATH:/home/phenegan/.local/bin"

      # direnv
      eval "$(direnv hook bash)"
    '';
  };
}
