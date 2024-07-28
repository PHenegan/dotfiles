# Utilities for software development
# TODO - restructure this into its own category and then make
# each language/workflow have its own file

{ config, pkgs, unstable, ... }:
{
  environment.systemPackages = with pkgs; [
    man-pages
    git gh
    rustup python312 nodejs corepack
    yarn
    gnumake gcc glibc libgcc clang-tools gdb valgrind 
    jdk jdk8 jdk11 jdk17
    jetbrains.idea-ultimate
    unstable.jetbrains.rust-rover
    vscode
    python311 pipx
    mars-mips # Assembly interpreter for cs3650
    rars # RISC V Assembly interpreter
  ];
}
