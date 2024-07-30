{ pkgs, ... }:

{
  programs.nixvim = {
    plugins.which-key = {
      enable = true;
      #   settings.spec = [
      #     {
      #       __unkeyed-1 = "<leader>b";
      #       desc = "Buffers";
      #     }
      #     {
      #       __unkeyed-1 = "<leader>d";
      #       desc = "Debug";
      #     }
      #     {
      #       __unkeyed-1 = "<leader>f";
      #       desc = "Find";
      #     }
      #     {
      #       __unkeyed-1 = "<leader>g";
      #       desc = "Git";
      #     }
      #     {
      #       __unkeyed-1 = "<leader>l";
      #       desc = "LSP";
      #     }
      #     {
      #       __unkeyed-1 = "<leader>m";
      #       desc = "Multicursors";
      #     }
      #     {
      #       __unkeyed-1 = "<leader>t";
      #       desc = "Terminal";
      #     }
      #   ];
      # };
      # Not using the NixVim config for which-key until the module has been updated to have more which-key v3 options (can't disable icons or set preset)
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
  };
}
