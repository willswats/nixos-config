{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    neovim
    # Dependencies
    fd
    ripgrep
    nodejs_20
    nodePackages.neovim
    python311
    python311Packages.pip
    python311Packages.pynvim
    rustup # rust-analyzer
    trash-cli # nvim-tree
    # Formatters
    nodePackages.prettier
    nodePackages.markdownlint-cli
    nixpkgs-fmt
  ];

  xdg.configFile.nvim.source = ./nvim;
}
