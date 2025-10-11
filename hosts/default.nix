{
  pkgs,
  host,
  globals,
  inputs,
  ...
}:

let
  user = globals.user;
in
{
  imports = [
    ../modules/desktop/sway
    # ../modules/desktop/hyprland
    ../modules/system/plymouth
    ../modules/system/pipewire
    ../modules/system/printing
    ../modules/system/bluetooth
    ../modules/development/dotnet
    ../modules/development/podman
    ../modules/development/nh
    ../modules/theme/gtk
    ../modules/theme/qt
    ../modules/theme/cursor
    ../modules/theme/catppuccin
    ../modules/utilities/gnome-keyring
    ../modules/utilities/pcmanfm
    ../modules/utilities/mullvad-vpn
    ../modules/utilities/virt-manager
    ../modules/utilities/wireshark
    ../modules/utilities/gpu-screen-recorder
    ../modules/servers/mpd
  ];

  # Settings and overlays
  nix.settings = {
    substituters = [
      "https://nix-gaming.cachix.org"
      "https://nixpkgs-wayland.cachix.org"
    ];
    trusted-public-keys = [
      "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
      "nixpkgs-wayland.cachix.org-1:3lwxaILxMRkVhehr5StQprHdEo4IrE8sRho9R9HOLYA="
    ];
  };

  nixpkgs.overlays = [ inputs.nixpkgs-wayland.overlay ];

  # 6.10 is needed for Vocaster One drivers
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Daemon for updating firmware
  services.fwupd.enable = true;

  services.flatpak.enable = true;

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

  console = {
    keyMap = "uk";
  };
  catppuccin.tty.enable = true;

  # Networking
  networking = {
    hostName = host.hostName;
    networkmanager.enable = true;
  };

  # Enable polkit
  security.polkit.enable = true;

  users.users.${user} = {
    isNormalUser = true;
    description = user;
    extraGroups = [
      "networkmanager"
      "wheel"
      "audio"
      "input"
    ];
    shell = pkgs.fish;
  };

  programs.fish.enable = true;

  environment = {
    variables = {
      TERMINAL = "kitty";
      EDITOR = "hx";
      NIXOS_OZONE_WL = "1"; # Wayland for Chromium and Electron
    };
    # Add shells to /etc/shells
    shells = with pkgs; [ fish ];
  };

  # Use the first portal implementation found in lexicographical order:
  # https://github.com/flatpak/xdg-desktop-portal/blob/1.18.1/doc/portals.conf.rst.in
  xdg.portal.config.common.default = "*";

  nix = {
    # Setup flakes
    package = pkgs.nixVersions.stable;
    extraOptions = "experimental-features = nix-command flakes";

    settings = {
      # Setup automatic garbage collection
      auto-optimise-store = true;
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

  system = {
    stateVersion = "23.05";
  };
}
