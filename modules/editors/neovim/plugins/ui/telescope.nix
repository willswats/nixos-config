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
        mappings.i."<esc>".__raw = ''
          function(...)
            return require("telescope.actions").close(...)
          end
        '';
      };
      keymaps = {
        "<leader>f" = {
          action = "find_files";
          options.desc = "Open file picker";
        };
        "<leader>/" = {
          action = "live_grep";
          options.desc = "Global search in workspace folder";
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
      };
    };
  };
}
