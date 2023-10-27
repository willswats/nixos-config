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
        directories = "~/Downloads ~/Pictures ~/Videos ~/Drive ~/Code";
        bookmarks =
          let
            bookmarkStart = "file://${homeDir}/";
          in
          [
            "${bookmarkStart}Downloads Downloads"
            "${bookmarkStart}Pictures Pictures"
            "${bookmarkStart}Code Code"
          ];
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
                center = "DP-1";
                left = "DP-2";
              };
              directories = "${directories} ~/Games/ROMs ~/Games/Doom/WADs ~/Games/Doom/pk3 ~/Games/TheForceEngine/DarkForces";
              bookmarks =
                let
                  bookmarkStart = "file://${homeDir}/";
                in
                [
                  "${bookmarkStart}Downloads Downloads"
                  "${bookmarkStart}Pictures Pictures"
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
              directories = directories;
              bookmarks = bookmarks;
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
                    ./hosts/laptop/home.nix
                    nixvim.homeManagerModules.nixvim
                  ];
                };
              }
            ];
          };

        virtual-desktop =
          let
            host = {
              hostName = "${user}-virtual-desktop";
              monitors = {
                center = "Virtual-1";
                left = "Virtual-1";
              };
              directories = directories;
              bookmarks = bookmarks;
            };
          in
          lib.nixosSystem {
            inherit system;
            specialArgs = {
              inherit globals host;
            };
            modules = [
              ./hosts
              ./hosts/virtual/desktop
              home-manager.nixosModules.home-manager
              {
                home-manager = {
                  useGlobalPkgs = true;
                  useUserPackages = true;
                  extraSpecialArgs = {
                    inherit globals host;
                  };
                  users.will.imports = [
                    ./hosts/virtual/home.nix
                    nixvim.homeManagerModules.nixvim
                  ];
                };
              }
            ];
          };

        virtual-laptop =
          let
            host = {
              hostName = "${user}-virtual-laptop";
              monitors = {
                center = "Virtual-1";
                left = "Virtual-1";
              };
              directories = directories;
              bookmarks = bookmarks;
            };
          in
          lib.nixosSystem {
            inherit system;
            specialArgs = {
              inherit globals host;
            };
            modules = [
              ./hosts
              ./hosts/virtual/laptop
              home-manager.nixosModules.home-manager
              {
                home-manager = {
                  useGlobalPkgs = true;
                  useUserPackages = true;
                  extraSpecialArgs = {
                    inherit globals host;
                  };
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
