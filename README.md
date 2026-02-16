# Dotfiles
This is the template for the nix flakes which I use on my personal devices

## Installation
### Initial Installation
1. Install NixOS and enable experimental nix flakes under `/etc/nixos/configuration.nix`
  - Add `nix.settings.experimental-features = [ "nix-command" "flakes" ];` anywhere in that file.
  - While you're there, you may also want to add `git` or any text editor like `vim` to use before the flake is installed
  - You may also want to update the device hostname, which will be useful for steps 3 and 7
2. Clone this repository to `~/.dotfiles` on your system
3. Make a folder for your device. I put mine under ./devices/[hostname] but technically they can go anywhere under the project.
4. Copy the contents of `/etc/nixos/hardware-configuration.nix` and `/etc/nixos/configuration.nix` and put them in your device's folder.
Make sure to adjust `configuration.nix` to import any desired nix files and remove conflicting configurations (packages, desktop manager, etc.)
5. Make a `home.nix` file in the same location as your `configuration.nix` and `hardware-configuration.nix`.
   Paste a home-manager template into this nix file, which can be found on the home-manager documentation page.
6. Add the filepaths and any necessary hardware modules in `flake.nix` under the `machines` value, following the structure of existing examples.
The property names represent the hostname of the device you wish to configure
7. `sudo nixos-rebuild switch --flake ~/.dotfiles/#[hostname]`

### Post Installation
You should now have a functional system, and can add any device-specific settings under nix files inside your `devices` folder.
See how I override niri behavior on a per-device level for examples of this.

Any time you make adjustments to the flake, you will need to run the command from step 7 again. You don't have to specify `#hostname` if it
matches the hostname your device currently has. If you are using the shared bash home file, you can use `rebuild` which is aliased to that command

You can use `nix flake update` whenever you wish to update the system, followed by a rebuild.
`nix-collect-garbage -d` will remove all generations prior to the current one (you have to rebuild again after to remove it from the boot menu).
Running that command with/without sudo determines whether home or system packages get cleaned.
You can also use the aliases `clean-home` and `clean-system` if you use the shared bash home file.

### Distro Compatibility Disclaimer (for Non-NixOS systems)
These are the dotfiles I use on my personal NixOS system. The actual config files are organized in a way such that they should work on other distros.
Most of the files under `config/` are being 1-to-1 mapped to a folder under the `~/.config/` directory, but you would need to make sure to install any equivalent packages
and dependencies on your distro. I have some overrides in device-specific folders, and some filepaths may need to be adjusted, but other than that
I try to maintain easy portability between other distros.

## Avoiding Merge Conflicts
(Only applies to Nix/home-manager systems)

I can't guarantee anything in the `shared` and `config` folders won't have merge conflicts. If you wish to modify any nix files, you can put them in your device folder.

## Image Sources
Ninetales wallpaper: Sourced from https://wallpaperaccess.com/alolan-ninetales
- If anyone has/finds a more exact source with artist credit on this one, open a issue and I'll replace this link

Ninetales icon: Sourced from https://pokemondb.net/sprites/ninetales

Porygon Wallpaper:
I made it based on a porygon image which I recolored to match shiny colors and then used for a wallpaper

Porygon icon: Sourced from https://pokemondb.net/sprites/porygon2

Cat Wallpaper: Sourced from https://github.com/zhichaoh/catppuccin-wallpapers/

Mimikyu icon: Sourced from https://pokemondb.net/sprites/mimikyu
