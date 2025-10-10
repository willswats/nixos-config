{ ... }:

let
  icons = import ../../icons.nix;
in
{
  programs.nixvim = {
    plugins.lualine = {
      enable = true;
      settings = {
        componentSeparators = {
          left = "";
          right = "";
        };
        sectionSeparators = {
          left = "";
          right = "";
        };
        # +-------------------------------------------------+
        # | A | B | C                             X | Y | Z |
        # +-------------------------------------------------+
        sections = {
          lualine_a = [
            {
              __unkeyed = "mode";
              separator.__unkeyed = "";
            }
          ];
          lualine_b = [
            {
              __unkeyed = "branch";
              icon.__unkeyed = icons.git.Branch;
              separator.__unkeyed = "";
            }
            {
              __unkeyed = "diagnostics";
              separator.__unkeyed = "";
              symbols = {
                error = "${icons.diagnostics.Error} ";
                warn = "${icons.diagnostics.Warning} ";
                hint = "${icons.diagnostics.Hint} ";
              };
            }
            {
              __unkeyed = "diff";
              separator.__unkeyed = "";
              symbols = {
                added = "${icons.git.LineAdded} ";
                modified = "${icons.git.LineModified} ";
                removed = "${icons.git.LineRemoved} ";
              };
            }
          ];
          lualine_c = [
            {
              __unkeyed = "filename";
              separator.__unkeyed = "";
            }
          ];
          lualine_y = [
            {
              __unkeyed = "progress";
              separator.__unkeyed = "";
            }
          ];
          lualine_z = [
            {
              __unkeyed = "location";
              separator.__unkeyed = "";
            }
          ];
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
              separator = "",
            },
            {
              "encoding", 
              separator = "",
            },
            {
              "filetype",
              separator = "",
            },
          },
        },
      })
    '';
  };
}
