# Dotfiles
This is the nix flake I use for my personal system

## Installation

(This section will be improved at some point since it's been a while since I did a fresh install)`

1. Install NixOS and enable experimental nix flakes under `/etc/nixos/configuration.nix`
2. Copy the `/etc/nixos/hardware-configuration.nix` file into the relevant folder under `./systems/`
3. `sudo nix-rebuild switch --flake ~/dotfiles/#[desired config name]`

### Distro Compatibility Disclaimer
These are the dotfiles I use on my personal NixOS system. The actual config files are organized in a way such that they should work on other distros.
Most of the files under the `config/` folder are being 1-to-1 mapped to the `.config/` directory, but you would need to make sure to install any equivalent packages
and dependencies on your distro.

### Image Sources
Ninetales wallpaper: Sourced from https://wallpaperaccess.com/alolan-ninetales
- If anyone finds a more exact source with artist credit on this one, open a issue and I'll replace this link

Ninetales icon: Sourced from https://pokemondb.net/sprites/ninetales


# I'm an idiot

The way this repo should have been structured
- A template repo which can be forked per device
  - A git submodule linking to a separate repo with all of the shared repos
  - actually not too sure about this since I still need a way to do laptop/desktop specific configs for e.g. hyprland
  - Maybe the home-manager stuff could be in the per-device repos (but those would probably be private which is kind of against the point of having public dotfiles)
  - Maybe do manual management for files instead of blanket copying the directory, then require a specific file called `hardware.conf` with device-specific stuff
