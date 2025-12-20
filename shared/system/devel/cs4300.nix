# Packages and settings for CS 4300 - Computer Graphics
{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    glfw
    glm
  ];
}
