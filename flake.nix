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
        desktop = lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit globals;
            host = {
              hostName = "${user}-desktop";
              monitors = {
                center = "DP-2";
                left = "DP-0";
              };
              font = {
                polybarSize = 14;
                rofiSize = 14;
                i3Size = 14.0;
                alacrittySize = 14;
              };
              directories = "${directories} ~/Games/WADs ~/Games/ROMs ~/Games/pk3";
              bookmarks =
                let
                  bookmarkStart = "file://${homeDir}";
                in
                [
                  "${bookmarkStart}Downloads Downloads"
                  "${bookmarkStart}Code Code"
                  "${bookmarkStart}Games Games"
                ];
            };
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
                  inherit globals;
                  host = {
                    hostName = "${user}-desktop";
                    monitors = {
                      center = "DP-2";
                      left = "DP-0";
                    };
                    font = {
                      polybarSize = 14;
                      rofiSize = 14;
                      i3Size = 14.0;
                      alacrittySize = 14;
                    };
                    directories = "${directories} ~/Games/WADs ~/Games/ROMs ~/Games/pk3";
                    bookmarks =
                      let
                        bookmarkStart = "file://${homeDir}";
                      in
                      [
                        "${bookmarkStart}Downloads Downloads"
                        "${bookmarkStart}Code Code"
                        "${bookmarkStart}Games Games"
                      ];
                  };
                };
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
          specialArgs = {
            inherit globals;
            host = {
              hostName = "${user}-laptop";
              monitors = {
                center = "eDP-1";
                left = "eDP-1";
              };
              font = {
                polybarSize = 14;
                rofiSize = 14;
                i3Size = 14.0;
                alacrittySize = 10;
              };
              directories = directories;
              bookmarks =
                let
                  bookmarkStart = "file://${homeDir}";
                in
                [
                  "${bookmarkStart}Downloads Downloads"
                  "${bookmarkStart}Code Code"
                ];
            };
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
                  inherit globals;
                  host = {
                    hostName = "${user}-laptop";
                    monitors = {
                      center = "eDP-1";
                      left = "eDP-1";
                    };
                    font = {
                      polybarSize = 14;
                      rofiSize = 14;
                      i3Size = 14.0;
                      alacrittySize = 10;
                    };
                    directories = directories;
                    bookmarks =
                      let
                        bookmarkStart = "file://${homeDir}";
                      in
                      [
                        "${bookmarkStart}Downloads Downloads"
                        "${bookmarkStart}Code Code"
                      ];
                  };
                };
                users.${user}.imports = [
                  ./hosts/home.nix
                  nixvim.homeManagerModules.nixvim
                ];
              };
            }
          ];
        };

        virtual = lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit globals;
            host = {
              hostName = "${user}-virtual";
              monitors = {
                center = "Virtual-1";
                left = "Virtual-1";
              };
              font = {
                polybarSize = 14;
                rofiSize = 14;
                i3Size = 14.0;
                alacrittySize = 14;
              };
              directories = directories;
              bookmarks =
                let
                  bookmarkStart = "file://${homeDir}";
                in
                [
                  "${bookmarkStart}Downloads Downloads"
                  "${bookmarkStart}Code Code"
                ];
            };
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
                  inherit globals;
                  host = {
                    hostName = "${user}-virtual";
                    monitors = {
                      center = "Virtual-1";
                      left = "Virtual-1";
                    };
                    font = {
                      polybarSize = 14;
                      rofiSize = 14;
                      i3Size = 14.0;
                      alacrittySize = 14;
                    };
                    directories = directories;
                    bookmarks =
                      let
                        bookmarkStart = "file://${homeDir}";
                      in
                      [
                        "${bookmarkStart}Downloads Downloads"
                        "${bookmarkStart}Code Code"
                      ];
                  };
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
