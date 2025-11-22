{
  description = "Flake for system state";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
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
    in {
      nixosConfigurations = {
        ninetales-alolan = lib.nixosSystem {
          inherit system;
          specialArgs = { inherit zen-browser; };
          modules = [
            ./modules/games
            ./modules/communication
            ./modules/devel
            ./modules/desktop/hyprland.nix
            ./modules/utilities
            ./modules/utilities/neovim.nix
            ./modules/utilities/pipewire.nix
            ./systems/laptop/configuration.nix
          ];
        };
      };
      homeConfigurations = {
        phenegan = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          # extraSpecialArgs = {inherit unstable; };
          modules = [
            ./home.nix
          ];
        };
      };
    };
}
