{ ... }:

let icons = import ../icons.nix;
in {
  programs.nixvim.plugins.gitsigns = {
    enable = true;
    signs = {
      add.text = icons.ui.LineLeft;
      change.text = icons.ui.LineLeft;
      delete.text = icons.ui.TriangleShortArrowRight;
      topdelete.text = icons.ui.TriangleShortArrowRight;
      changedelete.text = icons.ui.LineLeft;
    };
  };
}
