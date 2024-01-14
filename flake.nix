{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, nixvim, ... }: {
    nixosConfigurations =
      let
        system = "x86_64-linux";
        user = "will";
        homeDir = "/home/${user}";
        directories = "~/Downloads ~/Pictures ~/Videos ~/Books ~/Scripts ~/Code ~/Drive";
        bookmarks =
          let
            bookmarkStart = "file://${homeDir}/";
          in
          [
            "${bookmarkStart}Downloads Downloads"
            "${bookmarkStart}Pictures Pictures"
            "${bookmarkStart}Videos Videos"
            "${bookmarkStart}Books Books"
            "${bookmarkStart}Scripts Scripts"
            "${bookmarkStart}Code Code"
          ];
        globals = {
          user = user;
          homeDir = homeDir;
          wallpaper = ./wallpapers/minimal-desert.png;
          font = {
            package = "JetBrainsMono";
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
              hostName = "${user}-desktop";
              monitors = {
                center = "DP-1";
                left = "DP-2";
              };
              directories = "${directories} ~/Games/Heroic ~/Games/Bottles ~/Games/ROMs ~/Games/Doom/WADs ~/Games/Doom/pk3";
              bookmarks =
                let
                  bookmarkStart = "file://${homeDir}/";
                in
                [
                  "${bookmarkStart}Downloads Downloads"
                  "${bookmarkStart}Pictures Pictures"
                  "${bookmarkStart}Videos Videos"
                  "${bookmarkStart}Books Books"
                  "${bookmarkStart}Scripts Scripts"
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
