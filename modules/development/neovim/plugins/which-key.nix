{ pkgs, ... }:

{
  programs.nixvim = {
    # plugins.which-key = {
    #       enable = true;
    #       registrations = {
    #         "<leader>b" = "Buffers";
    #         "<leader>d" = "Debug";
    #         "<leader>f" = "Find";
    #         "<leader>g" = "Git";
    #         "<leader>l" = "LSP";
    #         "<leader>m" = "Multicursors";
    #         "<leader>t" = "Terminal";
    #       };
    #     }
    # Not using the NixVim config for which-key until the module has been updated to work with which-key v3 (can't disable icons or set preset)
    # This issue needs to be fixed as well before using NixVim registrations: https://github.com/nix-community/nixvim/issues/1901
    extraPlugins = with pkgs.vimPlugins;[ which-key-nvim ];
    extraConfigLua = ''
      local wk = require("which-key")

      wk.setup({
        preset = "helix",
        icons = {
          mappings = false,
          rules = false,
        }
      })

      wk.add({
        { "<leader>b", group = "Buffers" },
        { "<leader>d", group = "Debug" },
        { "<leader>f", group = "Find" },
        { "<leader>g", group = "Git" },
        { "<leader>l", group = "LSP" },
        { "<leader>m", group = "Multicursors" },
        { "<leader>t", group = "Terminal" },
      })
    '';
  };
}
