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
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      # stable = import inputs.stablePkgs {
      #   system = "${system}";
      #   config.allowUnfree = true;
      # };
      zen-browser = inputs.zen-browser.packages.${system};
      niri-workspace-switcher = inputs.niri-workspace-switcher.packages.${system};
    in {
      nixosConfigurations = {
        # NOTE: Change this to the name for your system
        ninetales-alolan = lib.nixosSystem {
          inherit system;
          specialArgs = { inherit zen-browser niri-workspace-switcher; };
          modules = [
            ./shared/system/games
            ./shared/system/communication
            ./shared/system/devel
            ./shared/system/desktop/niri.nix
            ./shared/system/utilities
            ./shared/system/utilities/neovim.nix
            ./shared/system/utilities/pipewire.nix
            ./configuration.nix
          ];
        };
      };
      homeConfigurations = {
        # NOTE: If you're someone else using this, change the username here
        phenegan = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          # extraSpecialArgs = {inherit unstable; };
          modules = [
            ./home.nix
            ./shared/home/bash
            ./shared/home/niri.nix
            ./shared/home/kitty.nix
          ];
        };
      };
    };
}
