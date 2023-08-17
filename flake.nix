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
        user = "will";
        homeDir = "/home/${user}";
        directories = "~/Drive ~/Code";
        globals = {
          user = user;
          homeDir = homeDir;
          wallpaper = ./wallpapers/minimal-desert.png;
        };
        lib = nixpkgs.lib;
      in
      {
        desktop =
          let
            host = {
              hostName = "${user}-desktop";
              monitors = {
                center = "DP-2";
                left = "DP-0";
              };
              font = {
                gtkSize = 10;
                polybarSize = 14;
                rofiSize = 14;
                i3Size = 14.0;
                alacrittySize = 14;
              };
              directories = "${directories} ~/Games/WADs ~/Games/ROMs ~/Games/pk3";
              bookmarks =
                let
                  bookmarkStart = "file://${homeDir}/";
                in
                [
                  "${bookmarkStart}Downloads Downloads"
                  "${bookmarkStart}Code Code"
                  "${bookmarkStart}Games Games"
                ];
            };
          in
          lib.nixosSystem
            {
              inherit system;
              specialArgs = {
                inherit globals host;
              };
              modules = [
                ./hosts
                ./hosts/desktop
                home-manager.nixosModules.home-manager
                {
                  home-manager = {
                    useGlobalPkgs = true;
                    useUserPackages = true;
                    extraSpecialArgs = {
                      inherit globals host;
                    };
                    users.will.imports = [
                      ./hosts/desktop/home.nix
                      nixvim.homeManagerModules.nixvim
                    ];
                  };
                }
              ];
            };

        laptop =
          let
            host = {
              hostName = "${user}-laptop";
              monitors = {
                center = "eDP-1";
                left = "eDP-1";
              };
              font = {
                gtkSize = 10;
                polybarSize = 16;
                rofiSize = 16;
                i3Size = 16.0;
                alacrittySize = 10;
              };
              directories = directories;
              bookmarks =
                let
                  bookmarkStart = "file://${homeDir}/";
                in
                [
                  "${bookmarkStart}Downloads Downloads"
                  "${bookmarkStart}Code Code"
                ];
            };
          in
          lib.nixosSystem {
            inherit system;
            specialArgs = {
              inherit globals host;
            };
            modules = [
              ./hosts
              ./hosts/laptop
              home-manager.nixosModules.home-manager
              {
                home-manager = {
                  useGlobalPkgs = true;
                  useUserPackages = true;
                  extraSpecialArgs = {
                    inherit globals host;
                  };
                  users.${user}.imports = [
                    ./hosts/home.nix
                    nixvim.homeManagerModules.nixvim
                  ];
                };
              }
            ];
          };

        virtual =
          let
            host = {
              hostName = "${user}-virtual";
              monitors = {
                center = "Virtual-1";
                left = "Virtual-1";
              };
              font = {
                gtkSize = 10;
                polybarSize = 14;
                rofiSize = 14;
                i3Size = 14.0;
                alacrittySize = 14;
              };
              directories = directories;
              bookmarks =
                let
                  bookmarkStart = "file://${homeDir}/";
                in
                [
                  "${bookmarkStart}Downloads Downloads"
                  "${bookmarkStart}Code Code"
                ];
            };
          in
          lib.nixosSystem {
            inherit system;
            specialArgs = {
              inherit globals host;
            };
            modules = [
              ./hosts
              ./hosts/virtual
              home-manager.nixosModules.home-manager
              {
                home-manager = {
                  useGlobalPkgs = true;
                  useUserPackages = true;
                  extraSpecialArgs = {
                    inherit globals host;
                  };
                  users.will.imports = [
                    ./hosts/home.nix
                    nixvim.homeManagerModules.nixvim
                  ];
                };
              }
            ];
          };
      };
  };
}
