{ ... }:

let icons = import ../icons.nix;
in {
  programs.nixvim.plugins.indent-blankline = {
    enable = true;
    char = icons.ui.LineLeft;
    contextChar = icons.ui.LineLeft;
  };
}
