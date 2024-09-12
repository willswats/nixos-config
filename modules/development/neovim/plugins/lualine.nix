{ ... }:

let icons = import ../icons.nix;
in {
  programs.nixvim = {
    plugins.lualine = {
      enable = true;
      settings = {
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
              __unkeyed = "branch";
              icon.__unkeyed = icons.git.Branch;
            }
            {
              __unkeyed = "diagnostics";
              symbols = {
                error = "${icons.diagnostics.Error} ";
                warn = "${icons.diagnostics.Warning} ";
                hint = "${icons.diagnostics.Hint} ";
              };
            }
            {
              __unkeyed = "diff";
              symbols = {
                added = "${icons.git.LineAdded} ";
                modified = "${icons.git.LineModified} ";
                removed = "${icons.git.LineRemoved} ";
              };
            }
          ];
          lualine_c = [ "filename" ];
          lualine_y = [ "progress" ];
          lualine_z = [ "location" ];
        };
      };
    };
    # Enable showmode https://github.com/folke/noice.nvim/wiki/A-Guide-to-Messages#showmode
    # Showmode is needed, because when you record macros it stops cmp https://github.com/hrsh7th/nvim-cmp/issues/1692
    extraConfigLua = ''
      require("lualine").setup({
        sections = {
          lualine_x = {
            {
              require("noice").api.statusline.mode.get,
              cond = require("noice").api.statusline.mode.has,
            },
            "encoding", 
            "filetype"
          },
        },
      })
    '';
  };
}
