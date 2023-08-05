{ ... }:

{
  programs.nixvim.plugins.toggleterm = {
    enable = true;
    autochdir =
      true; # When neovim changes it current directory the terminal will change it’s own when next it’s opened
    openMapping = "<c-t>"; # Mapping to open the terminal
    direction = "float"; # Floating terminal
    floatOpts = { border = "single"; }; # Floating terminal options
  };
}
