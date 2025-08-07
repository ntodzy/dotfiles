{ config, pkgs, inputs, ... }:

{
  users.users.todzy = {
    isNormalUser = true;
    description = "Nathan Todzy";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [ neovim firefox spotify gcc discord obsidian ];

    openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIC4V7ABuzQhrEiLXGVBhLZKxh9pzlOAgHEjSu0Yot0Vy todzy@todzy-ltp" # work-ltp
    ];
  };
}