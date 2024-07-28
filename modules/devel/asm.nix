# Utilities for Assembly development

{ config, pkgs, unstable, ... }:
{
  environment.systemPackages = with pkgs; [
    mars-mips # MIPS Interpreter for CS 3650 
    rars # RISC V Interpreter for EECE 2322/2323
  ];
}
