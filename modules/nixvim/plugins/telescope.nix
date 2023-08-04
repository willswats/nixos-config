{ pkgs, ... }: {

  home.packages = with pkgs; [
    fd # Telescope dependency
    ripgrep # Telescope dependency
  ];

  programs.nixvim.plugins.telescope = { enable = true; };
}
