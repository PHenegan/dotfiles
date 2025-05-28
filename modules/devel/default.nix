# Utilities for software development
# TODO - restructure this into its own category and then make
# each language/workflow have its own file

{ config, pkgs, ... }:
{
  imports = [
    ./c-lang.nix
    ./cs4700.nix
    ./cy3740.nix
  ];

  environment.sessionVariables = rec {
    PATH = [
      "$HOME/.bun/bin"
    ];
  };

  environment.systemPackages = with pkgs; [
    man-pages man-pages-posix
    git gh
    cloc
    rustup rust-analyzer
    python311 python311Packages.pip virtualenv
    nodejs corepack
    yarn bun
    jdk jdk8 jdk11 jdk17
    jetbrains.rust-rover
    vscode
  ];
}
