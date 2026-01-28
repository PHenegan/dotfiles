{
  description = "Flake for system state";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    zen-browser.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    niri-workspace-switcher.url = "github:PHenegan/niri-workspace-switcher";
    niri-workspace-switcher.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... } @ inputs:
    let
      lib = nixpkgs.lib;
      machines = {
        mimikyu = {
          # Dell XPS 15 9560 - wishes it was a thinkpad
          system = "x86_64-linux";
          systemFile = ./devices/mimikyu/configuration.nix;
          homeFile = ./devices/mimikyu/home.nix;
        };
      };
    in {
      nixosConfigurations = builtins.mapAttrs (
        _: machine:
        lib.nixosSystem {
          specialArgs = {
            zen-browser = inputs.zen-browser.packages.${machine.system};
            niri-workspace-switcher = inputs.niri-workspace-switcher.packages.${machine.system};
          };
          modules = [ machine.systemFile ];
        }
      ) machines;

      homeConfigurations = builtins.mapAttrs (
        _: machine:
        lib.nixosSystem {
          pkgs = nixpkgs.legacyPackages.${machine.system};
          modules = [ machine.homeFile ];
        }
      ) machines;
    };
}
