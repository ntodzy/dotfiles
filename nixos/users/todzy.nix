{ config, pkgs, inputs, ... }:

{
  users.users.todzy = {
    isNormalUser = true;
    description = "Nathan Todzy";
    extraGroups = [ "networkmanager" "wheel" "input" "video" ];
    packages = with pkgs; [ neovim firefox spotify gcc discord obsidian ];

    openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIC4V7ABuzQhrEiLXGVBhLZKxh9pzlOAgHEjSu0Yot0Vy todzy@todzy-ltp" # work-ltp
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJrqPmNqIsGXvKnTch3Uam3VtwG15rELb7ZyGxf5hFT6 todzy@todzydesktop" # desktop
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEP2o+gpWhwzVCCB9YB5dvmnOME9GKUvOGsZzzQPZzzV skygu@NT-Laptop" # windows laptop
	"ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMpzv5JSCEKFdI3t8Wj6yvD8Ox9Ie9aF4qBJCnUQsoFp todzy@todzyexp2" # todzyexp2.cs.wisc.edu
    ];
  };
}
