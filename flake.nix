{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim.url = "github:nix-community/nixvim";
  };

  outputs = { nixpkgs, home-manager, nixvim, ... }: {
    nixosConfigurations =
      let
        system = "x86_64-linux";
        lib = nixpkgs.lib;
      in
      {
        desktop = lib.nixosSystem {
          inherit system;
          modules = [
            ./hosts
            ./hosts/desktop
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.will.imports = [
                  ./hosts/desktop/home.nix
                  nixvim.homeManagerModules.nixvim
                ];
              };
            }
          ];
        };

        laptop = lib.nixosSystem {
          inherit system;
          modules = [
            ./hosts
            ./hosts/laptop
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.will.imports = [
                  ./hosts/laptop/home.nix
                  nixvim.homeManagerModules.nixvim
                ];
              };
            }
          ];
        };

        virtual = lib.nixosSystem {
          inherit system;
          modules = [
            ./hosts
            ./hosts/virtual
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.will.imports = [
                  ./hosts/virtual/home.nix
                  nixvim.homeManagerModules.nixvim
                ];
              };
            }
          ];
        };
      };
  };
}
