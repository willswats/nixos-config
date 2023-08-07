{ ... }:

let icons = import ../icons.nix;
in {
  programs.nixvim.plugins.lualine = {
    enable = true;
    componentSeparators = {
      left = icons.ui.LineMiddle;
      right = icons.ui.LineMiddle;
    };
    sectionSeparators = {
      left = "";
      right = "";
    };
    # +-------------------------------------------------+
    # | A | B | C                             X | Y | Z |
    # +-------------------------------------------------+
  };
}
