# Dotfiles
This is the template for the nix flakes which I use on my personal devices

## Installation
This repo is intended to be a template, and not the actual repository used for managing a device (ignore previous git history where I used this for my laptop).
You can either fork this repository and put it on any git server, or you can just clone it locally and keep your commits exclusively on device.

(This section will be improved at some point since it's been a while since I did a fresh install)`

### Installing the system flake
1. Install NixOS and enable experimental nix flakes under `/etc/nixos/configuration.nix`
2. Copy the contents of `/etc/nixos/hardware-configuration.nix` and `/etc/nixos/configuration.nix` and put them at the top directory of this project.
3. Replace any device names and/or usernames with your desired ones.
4. `sudo nix-rebuild switch --flake ~/dotfiles/#[desired config name]`

### Setting up Home Manager
I still need to write this section.

### Distro Compatibility Disclaimer (for Non-NixOS systems)
These are the dotfiles I use on my personal NixOS system. The actual config files are organized in a way such that they should work on other distros.
Most of the files under `config/` are being 1-to-1 mapped to the `~/.config/` directory, but you would need to make sure to install any equivalent packages
and dependencies on your distro.

## Avoiding Merge Conflicts
(Only applies to Nix/home-manager systems)

I can't guarantee anything in the `shared` and `config` folders won't have merge conflicts. For modifications the `config` folder, you can make a new nix module overriding the original file, and use Nix's priority system to give your file a higher priority than the one in the `config` folder. You can also just copy the files, make modifications, and use a new nix module mapping them instead of the original.
- An example of this is in `config/hypr`, where I created a file designed to be overriden without having to copy/modify the entire thing.


## Image Sources
Ninetales wallpaper: Sourced from https://wallpaperaccess.com/alolan-ninetales
- If anyone finds a more exact source with artist credit on this one, open a issue and I'll replace this link

Ninetales icon: Sourced from https://pokemondb.net/sprites/ninetales
