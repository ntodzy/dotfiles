{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../../base.nix
      ../../modules/de.nix

      # Users
      # Don't forget to set a password with ‘passwd’.
      ../../users/todzy.nix
    ];

  networking = {
    hostName = "todzy-ltp";
    domain = "cs.wisc.edu";
  };

  # Enable networking
  networking.networkmanager.enable = true;
  programs.ssh.startAgent = true;

  
  users.users.todzy = {
  isNormalUser = true;
    description = "Nathan Todzy";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [ neovim firefox spotify gcc discord obsidian ];
  };

  # Monitors Hyprland
  

  
  system.stateVersion = "25.05"; # Did you read the comment?
}
