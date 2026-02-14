{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur.url = "github:nix-community/NUR";
    nix-alien.url = "github:thiagokokada/nix-alien";
    nixpkgs-wayland = {
      url = "github:nix-community/nixpkgs-wayland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    catppuccin.url = "github:catppuccin/nix";

    # Editors
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    helix.url = "github:helix-editor/helix";
    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";

    # Apps
    mpv-youtube-search.url = "github:willswats/mpv-youtube-search";
    nyaa = {
      url = "github:Beastwick18/nyaa";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Gaming
    slippi.url = "github:lytedev/slippi-nix";
    nix-gaming.url = "github:fufexan/nix-gaming";
    bsp-casefolding-workaround.url = "github:SeraphimRP/bsp-casefolding-workaround-nix/v1.0.1";
  };

  outputs =
    { nixpkgs
    , nixos-hardware
    , home-manager
    , nur
    , nixvim
    , catppuccin
    , slippi
    , nix-gaming
    , bsp-casefolding-workaround
    , nyaa
    , ...
    }@inputs:
    {
      nixosConfigurations =
        let
          system = "x86_64-linux";
          user = "will";
          directories = {
            home = "/home/${user}";
            flake = "/home/${user}/Code/nixos-config";
          };
          directoriesToCreate = "~/Downloads ~/Pictures ~/Videos ~/Code ~/Edits";
          hostNames = {
            desktop = "${user}-desktop";
            laptop = "${user}-laptop";
          };
          globals = {
            user = user;
            directories = directories;
            hostNames = hostNames;
            wallpaper = {
              url = "https://i.redd.it/mgq8j7bpc7w71.png";
              hash = "sha256-zWdMqIYDF86GaM/iahHcRMddDh0vTBmHD4Cbzw4B+x8=";
            };
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
                directories = {
                  drive = "/run/media/will/2TB/Dropbox";
                  gameDrive = "/run/media/will/2TB-SSD";
                };
                directoriesToCreate = "${directoriesToCreate} /run/media/will/2TB-SSD/Games/Heroic";
              };
            in
            lib.nixosSystem {
              inherit system;
              specialArgs = {
                inherit inputs globals host;
              };
              modules = [
                ./hosts/desktop
                nixos-hardware.nixosModules.gigabyte-b550
                home-manager.nixosModules.home-manager
                nur.modules.nixos.default
                catppuccin.nixosModules.catppuccin
                slippi.nixosModules.default
                nix-gaming.nixosModules.pipewireLowLatency
                nix-gaming.nixosModules.platformOptimizations
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
                      nixvim.homeModules.nixvim
                      catppuccin.homeModules.catppuccin
                      slippi.homeManagerModules.default
                      bsp-casefolding-workaround.nixosModules.default
                      nyaa.homeManagerModule
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
                directories = {
                  drive = "/home/will/Dropbox";
                };
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
                nix-gaming.nixosModules.pipewireLowLatency
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
                      nixvim.homeModules.nixvim
                      catppuccin.homeModules.catppuccin
                      nyaa.homeManagerModule
                    ];
                  };
                }
              ];
            };
        };
    };
}
