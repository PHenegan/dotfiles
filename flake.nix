{
  description = "Flake for system state";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    zen-browser.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... } @ inputs:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      # see how pkgs is setup in this post to avoid legacy usage 
      # https://discourse.nixos.org/t/home-manager-flake-and-configuration-how-to-rebuild-the-whole-environment-with-just-nixos-rebuild-switch/38767
      pkgs = nixpkgs.legacyPackages.${system};
      # stable = import inputs.stablePkgs {
      #   system = "${system}";
      #   config.allowUnfree = true;
      # };
      zen-browser = inputs.zen-browser.packages.${system};
    in {
      nixosConfigurations = {
        # NOTE: Change this to the name for your system
        ninetales-alolan = lib.nixosSystem {
          inherit system;
          specialArgs = { inherit zen-browser; };
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
            ./shared/home/hyprland.nix
            ./shared/home/kitty.nix
          ];
        };
      };
    };
}
