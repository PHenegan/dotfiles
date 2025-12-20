# Tools and libraries used for development in C and C++ programming languages

{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    gcc glibc libgcc
    gdb
    clang-tools
    gnumake cmake
    valgrind
    SDL2
  ];
}
