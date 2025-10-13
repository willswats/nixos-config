{ pkgs, ... }:

let
  icons = import ../../icons.nix;
in
{

  home.packages = with pkgs; [
    fd # Telescope dependency
    ripgrep # Telescope dependency
  ];

  programs.nixvim = {
    plugins.telescope = {
      enable = true;
      settings.defaults = {
        prompt_prefix = "${icons.ui.Telescope} ";
        selection_caret = "${icons.ui.Forward} ";
        # Exit Telescope in one key press
        mappings = {
          i = {
            "<esc>".__raw = ''
              function(...)
                return require("telescope.actions").close(...)
              end
            '';
            "<Tab>".__raw = "require('telescope.actions').move_selection_next";
            "<S-Tab>".__raw = "require('telescope.actions').move_selection_previous";
          };
        };
      };
      keymaps = {
        "<leader>f" = {
          action = "find_files";
          options.desc = "Open file picker";
        };
        "<leader>/" = {
          action = "live_grep";
          options.desc = "Global search";
        };
        "<leader>'" = {
          action = "resume";
          options.desc = "Open last picker";
        };
        "<leader>b" = {
          action = "buffers";
          options.desc = "Open buffer picker";
        };
        "<leader>d" = {
          action = "diagnostics";
          options.desc = "Open diagnostics picker";
        };
        "<leader>s" = {
          action = "telescope_document_symbols";
          options.desc = "Open symbol picker";
        };
      };
    };
  };
}
