{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";

    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";

      # THIS IS IMPORTANT
      # Mismatched system dependencies will lead to crashes and other issues.
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri = {
    	url = "github:sodiboo/niri-flake";
	inputs.nixpkgs.follows="nixpkgs";
    };

    dms = {
      url = "github:AvengeMedia/DankMaterialShell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dgop = {
      url = "github:AvengeMedia/dgop";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, ... } @ inputs: {
    nixosConfigurations.todzydesktop = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [ ./hosts/desktop/configuration.nix ];
    };

    nixosConfigurations.todzy-ltp = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [ ./hosts/todzy-ltp/configuration.nix ];
    };

    nixosConfigurations.todzyexp2 = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [ ./hosts/todzyexp2.cs.wisc.edu/configuration.nix ];
    };

    nixosConfigurations.venator = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [ ./hosts/venator/configuration.nix ];
    };
    
    nixosConfigurations.todzy-work = {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [ ./hosts/workltp/configuration.nix ];
    };
  };
}
