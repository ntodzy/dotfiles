# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  # System Setup
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ]; 
  nix.gc.automatic = true;
  nix.gc.options = "--delete-older-than 3d";

  # NETWORKING and SSH
  time.timeZone = "America/Chicago";
  networking.networkmanager.enable = true;
  programs.ssh.startAgent = true;

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

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

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  ############################
  # Services
  ############################
  # sounds
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;

    settings = {
      General = {
        Experimental = true;
      };
    };
  };

  # VPN & Tailscale
  services.tailscale = {
    enable = true;
  };

  # Power
  powerManagement.enable = true;
  services.upower.enable = true;
  
  # Thunderbolt
  services.hardware.bolt.enable = true;

  # List packages installed in system profile. To search, run:
  environment.systemPackages = with pkgs; [
    # System Packages
    git
    wget
    brightnessctl
    playerctl
    wl-clipboard
    fanctl
    flameshot
    grim
    slurp

    # audio
    pipewire
    wireplumber

    # global programs..
    neovim
    vscode
    nautilus
    gimp
    bluetui
  ];

  fonts.packages = [                                                                                         
    pkgs.nerd-fonts.fira-code                                                       
    pkgs.nerd-fonts.droid-sans-mono                                                               
    pkgs.nerd-fonts.symbols-only                                                       
  ];
}
