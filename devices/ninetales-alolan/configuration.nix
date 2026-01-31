# Edit this configuration ile to define what should be installed on
# your system.  Help is av sailable in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, lib, pkgs, ... }:

{
  # Include the results of the hardware scan.
  imports = [
    ./hardware-configuration.nix
    ./shared/system/utilities/work.nix
    ../../shared/system/communication
    ../../shared/system/devel
    ../../shared/system/desktop/niri.nix
    ../../shared/system/games
    ../../shared/system/utilities
    ../../shared/system/utilities/neovim.nix
    ../../shared/system/utilities/pipewire.nix
  ];

  # Some hardware stuff that I didn't want to get overriden
  swapDevices = [ {
    device = "/var/lib/swapfile";
    size = 24 * 1024; # size in Mib
    randomEncryption = true;
  } ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.plymouth = {
    enable = true;
    themePackages = with pkgs; [
      catppuccin-plymouth
      plymouth-blahaj-theme
    ];
    theme = "blahaj";
  };

  networking.hostName = "ninetales-alolan"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  # NOTE - To get wifi passwords to save forever, you have to check the wifi setting to save
  # "for all users" - that way it will work
  networking.networkmanager.enable = true;
  networking.firewall.checkReversePath = false; # for WireGuard VPNs
  # Wifi speeds can become faster when BBR is used instead of CUBIC for congestion control
  boot.kernel.sysctl."net.core.default_qdisc" = "fq";
  boot.kernel.sysctl."net.ipv4.tcp_congestion_control" = "bbr";

  # Enable bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Fix time issues for windows in dual-boot
  time.hardwareClockInLocalTime = true;

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Setting for nvidia containers in podman
  # hardware.nvidia-container-toolkit.enable = true;

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  # services.xserver.displayManager.gdm.enable = true;
  # services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;
    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };

  # Allows running regular linux binaries (needed for neovim plugins)
  programs.nix-ld.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.phenegan = {
    isNormalUser = true;
    description = "Patrick Henegan";
    extraGroups = [ "networkmanager" "wheel" "input" ];
    packages = with pkgs; [
      firefox
    #  thunderbird
    ];
  };

  security.polkit.enable = true;
 
  # Asus 
  services.supergfxd = {
    enable = true;
    settings = {
      mode = "Integrated";
      vfio_enable = false;
      vfio_save = false;
      always_reboot = false;
      no_logind = false;
      logout_timeout_s = 180;
      hotplug_type = "None";
    };
  };

  services.asusd = {
    enable = true;
    enableUserService = true;
  };

  services.power-profiles-daemon.enable = true;

  # services.tlp.enable = true;
  
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  programs.direnv.enable = true;

  nixpkgs.config.permittedInsecurePackages = [
    "libsoup-2.74.3"
  ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget - this is a lie lmao
  environment.systemPackages = with pkgs; [
    powertop
    fusuma
    xdotool
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?
}
