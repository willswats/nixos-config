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
    sections = {
      lualine_a = [ "mode" ];
      lualine_b = [
        {
          name = "branch";
          icon = icons.git.Branch;
        }
        {
          name = "diagnostics";
          extraConfig = {
            symbols = {
              error = "${icons.diagnostics.Error} ";
              warn = "${icons.diagnostics.Warning} ";
              hint = "${icons.diagnostics.Hint} ";
            };
          };
        }
        {
          name = "diff";
          extraConfig = {
            symbols = {
              added = "${icons.git.LineAdded} ";
              modified = "${icons.git.LineModified} ";
              removed = "${icons.git.LineRemoved} ";
            };
          };
        }
      ];
      lualine_c = [ "filename" ];
      lualine_x = [ "encoding" "filetype" ];
      lualine_y = [ "progress" ];
      lualine_z = [ "location" ];
    };
  };
}
