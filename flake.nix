{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nur.url = "github:nix-community/NUR";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin.url = "github:catppuccin/nix";

    slippi.url = "github:lytedev/slippi-nix";
  };

  outputs =
    { nixpkgs
    , home-manager
    , nur
    , nixvim
    , catppuccin
    , slippi
    , ...
    }@inputs: {
      nixosConfigurations =
        let
          system = "x86_64-linux";
          user = "will";
          directories = {
            home = "/home/${user}";
            flake = "/home/${user}/Code/nixos-config";
          };
          directoriesToCreate = "~/Downloads ~/Pictures ~/Videos ~/Code";
          hostNames = {
            desktop = "${user}-desktop";
            laptop = "${user}-laptop";
          };
          globals = {
            user = user;
            directories = directories;
            hostNames = hostNames;
            wallpaper = ./wallpaper.png;
            font = {
              name = "JetBrains Mono Nerd Font";
            };
            colours = {
              rosewater = "f5e0dc";
              flamingo = "f2cdcd";
              pink = "f5c2e7";
              mauve = "cba6f7";
              red = "f38ba8";
              maroon = "eba0ac";
              peach = "fab387";
              yellow = "f9e2af";
              green = "a6e3a1";
              teal = "94e2d5";
              sky = "89dceb";
              sapphire = "74c7ec";
              blue = "89b4fa";
              lavender = "b4befe";
              text = "cdd6f4";
              subtext1 = "bac2de";
              subtext0 = "a6adc8";
              overlay2 = "9399b2";
              overlay1 = "7f849c";
              overlay0 = "6c7086";
              surface2 = "585b70";
              surface1 = "45475a";
              surface0 = "313244";
              base = "1e1e2e";
              mantle = "181825";
              crust = "11111b";
            };
          };
          lib = nixpkgs.lib;
        in
        {
          desktop =
            let
              host = {
                hostName = hostNames.desktop;
                monitors = {
                  center = "DP-1";
                  left = "DP-2";
                };
                directories = { drive = "/run/media/will/2TB/Dropbox"; };
                directoriesToCreate = "${directoriesToCreate} ~/Games/Heroic";
              };
            in
            lib.nixosSystem
              {
                inherit system;
                specialArgs = {
                  inherit inputs globals host;
                };
                modules = [
                  ./hosts/desktop
                  home-manager.nixosModules.home-manager
                  nur.modules.nixos.default
                  catppuccin.nixosModules.catppuccin
                  slippi.nixosModules.default
                  {
                    home-manager = {
                      useGlobalPkgs = true;
                      useUserPackages = true;
                      extraSpecialArgs = {
                        inherit inputs globals host;
                      };
                      users.will.imports = [
                        ./hosts/desktop/home.nix
                        nur.modules.homeManager.default
                        nixvim.homeManagerModules.nixvim
                        catppuccin.homeManagerModules.catppuccin
                        slippi.homeManagerModules.default
                      ];
                    };
                  }
                ];
              };
          laptop =
            let
              host = {
                hostName = hostNames.laptop;
                monitors = {
                  center = "eDP-1";
                  left = "eDP-1";
                };
                directories = { drive = "/home/will/Dropbox"; };
                directoriesToCreate = directoriesToCreate;
              };
            in
            lib.nixosSystem {
              inherit system;
              specialArgs = {
                inherit inputs globals host;
              };
              modules = [
                ./hosts/laptop
                home-manager.nixosModules.home-manager
                nur.modules.nixos.default
                catppuccin.nixosModules.catppuccin
                {
                  home-manager = {
                    useGlobalPkgs = true;
                    useUserPackages = true;
                    extraSpecialArgs = {
                      inherit inputs globals host;
                    };
                    users.${user}.imports = [
                      ./hosts/home.nix
                      nur.modules.homeManager.default
                      nixvim.homeManagerModules.nixvim
                      catppuccin.homeManagerModules.catppuccin
                    ];
                  };
                }
              ];
            };
        };
    };
}
