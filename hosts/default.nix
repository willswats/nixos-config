{ pkgs, host, globals, ... }:

let
  user = globals.user;
in
{
  imports = [
    ../modules/system/hyprland
    ../modules/system/sddm
    ../modules/system/plymouth
    ../modules/system/pipewire
    ../modules/system/printing
    ../modules/development/dotnet
    ../modules/theme/gtk
    ../modules/theme/qt
    ../modules/utilities/mullvad-vpn
    ../modules/utilities/virt-manager
    ../modules/utilities/docker
  ];

  time.timeZone = "Europe/London";

  i18n = {
    defaultLocale = "en_GB.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "en_GB.UTF-8";
      LC_IDENTIFICATION = "en_GB.UTF-8";
      LC_MEASUREMENT = "en_GB.UTF-8";
      LC_MONETARY = "en_GB.UTF-8";
      LC_NAME = "en_GB.UTF-8";
      LC_NUMERIC = "en_GB.UTF-8";
      LC_PAPER = "en_GB.UTF-8";
      LC_TELEPHONE = "en_GB.UTF-8";
      LC_TIME = "en_GB.UTF-8";
    };
  };

  console.keyMap = "uk";

  # Set the kernel to xanmod (better performance)
  boot.kernelPackages = pkgs.linuxPackages_xanmod_latest;

  # Networking
  networking = {
    hostName = host.hostName;
    networkmanager.enable = true;
  };

  # Enable bluetooth 
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  # Enable polkit
  security.polkit.enable = true;

  users.users.${user} = {
    isNormalUser = true;
    description = user;
    extraGroups = [ "networkmanager" "wheel" "audio" "input" ];
    shell = pkgs.fish;
  };

  programs.fish.enable = true;

  environment = {
    variables = {
      TERMINAL = "wezterm";
      EDITOR = "nvim";
    };
    # Add shells to /etc/shells
    shells = with pkgs; [ fish ];
  };

  # Use the first portal implementation found in lexicographical order:
  # https://github.com/flatpak/xdg-desktop-portal/blob/1.18.1/doc/portals.conf.rst.in
  xdg.portal.config.common.default = "*";

  nix = {
    # Setup flakes
    package = pkgs.nixFlakes;
    extraOptions = "experimental-features = nix-command flakes";

    settings = {
      # Setup automatic garbage collection
      auto-optimise-store = true;
      # Setup nix-gaming cachix
      substituters = [ "https://nix-gaming.cachix.org" ];
      trusted-public-keys = [ "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4=" ];
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  nixpkgs.config = {
    # Allow unfree packages
    allowUnfree = true;
  };

  system = { stateVersion = "23.05"; };
}
