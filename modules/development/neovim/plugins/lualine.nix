{ pkgs, ... }:

{
  programs.nixvim = {
    extraPlugins = with pkgs.vimPlugins; [ lualine-nvim ];
    extraConfigLua = ''
      local lualine = require("lualine")

      local branch = {
        "branch",
        icon = ""
      }

      local diagnostics = {
        "diagnostics",
        symbols = {
          error = "" .. " ",
          warn = "" .. " ",
          hint = "󰌶" .. " "
        },
      }

      local diff = {
        "diff",
        symbols = {
          added = "" .. " ",
          modified = "" .. " ",
          removed = "" .. " "
        },
      }

      lualine.setup({
        options = {
          component_separators = { left = "│", right = "│" },
          section_separators = { left = "", right = "" },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { branch, diff, diagnostics },
          lualine_c = { "filename" },
          lualine_x = { "encoding", "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" }
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { "filename" },
          lualine_x = { "location" },
          lualine_y = {},
          lualine_z = {},
        },
      })
    '';
  };
}
