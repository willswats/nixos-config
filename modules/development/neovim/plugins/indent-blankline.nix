{ ... }:

let
  icons = import ../icons.nix;
in
{
  programs.nixvim.plugins.indent-blankline = {
    enable = true;
    scope.enabled = false;
    indent.char = icons.ui.LineLeft;
    scope.char = icons.ui.LineLeft;
  };
}
