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
          modules = [ 
            machine.systemFile
            # NOTE:
            # Honestly I'd rather have home-manager be a standalone installation
            # but I couldn't think of a way to make the configurations apply per-machine
            # while having the same username
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.phenegan = machine.homeFile;
            }
          ];
        }
      ) machines;
    };
}
