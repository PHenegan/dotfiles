# Utilities for software development
# TODO - restructure this into its own category and then make
# each language/workflow have its own file

{ config, pkgs, unstable, ... }:
{
  imports = [
    ./asm.nix
    ./c-lang.nix
  ];

  environment.systemPackages = with pkgs; [
    man-pages man-pages-posix
    git gh
    rustup unstable.rust-analyzer
    python312 nodejs corepack
    yarn
    unstable.jdk jdk8 jdk11 jdk17
    jetbrains.idea-ultimate
    unstable.jetbrains.rust-rover
    vscode
    python311 pipx
  ];
}
