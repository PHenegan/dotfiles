{
  description = "Flake for system state";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.05";
    unstablePkgs.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... } @ inputs:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      unstable = import inputs.unstablePkgs {
        system = "${system}";
	      config.allowUnfree = true;
      };
    in {
      nixosConfigurations = {
        ninetales-alolan = lib.nixosSystem {
          inherit system;
          specialArgs = { inherit unstable; };
          modules = [
            ./modules/games
            ./modules/communication
            ./modules/devel
	          ./modules/desktop/hyprland.nix
	          ./modules/desktop/plasma.nix
	          ./modules/utilities
	          ./modules/utilities/neovim.nix
	          ./systems/laptop/configuration.nix
	        ];
        };
      };
      homeConfigurations = {
        phenegan = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = {inherit unstable; };
          modules = [
            ./home.nix
          ];
        };
      };
    };
}
