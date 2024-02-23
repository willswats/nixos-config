{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/system/amd
    ../../modules/system/opentabletdriver
    ../../modules/system/wooting
    ../../modules/games/steam
    ../../modules/games/r2modman
  ];

  boot = {
    initrd = {
      secrets = { "/crypto_keyfile.bin" = null; }; # Setup keyfile
      luks.devices."luks-1bb26d75-1e56-449f-9a51-bb94ea8183e7".device = "/dev/disk/by-uuid/1bb26d75-1e56-449f-9a51-bb94ea8183e7";
      luks.devices."luks-1bb26d75-1e56-449f-9a51-bb94ea8183e7".keyFile = "/crypto_keyfile.bin";
    };
    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 20; # Limit the amount of configurations
      };
      efi.canTouchEfiVariables = true;
    };
  };

  nix.settings = {
    # Setup nix-gaming cachix
    substituters = [ "https://nix-gaming.cachix.org" ];
    trusted-public-keys = [ "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4=" ];
  };

  programs.gamemode.enable = true;
  programs.gamescope = {
    enable = true;
    args = [
      "-w 1920"
      "-h 1080"
      "-W 1920"
      "-H 1080"
      "-f" # Fullscreen by default
    ];
  };
}
