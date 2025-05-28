# Module including SDDM, Plasma Desktop,
# and some extra KDE utilities
{ config, pkgs, ... }:

{
  services.desktopManager.plasma6.enable = true;
  services.displayManager.sddm.enable = true;
  
  environment.systemPackages = with pkgs; [
    libsForQt5.khotkeys
    kdePackages.breeze-gtk
    kdePackages.kate
    materia-kde-theme
  ];
}
