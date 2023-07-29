{ pkgs, ... }:

{
  home.packages = with pkgs; [
    neovim
    fd
    ripgrep
    gcc
    rustup
    nodejs_20
    python311
    python311Packages.pip
    nodePackages.neovim
    python311Packages.pynvim
    nodePackages.prettier
    nodePackages.markdownlint-cli
    nixpkgs-fmt
    trash-cli
  ];

  xdg.configFile.nvim.source = ./nvim;
}
