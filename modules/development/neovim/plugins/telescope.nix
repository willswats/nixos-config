{ pkgs, ... }:

let icons = import ../icons.nix;
in {

  home.packages = with pkgs; [
    fd # Telescope dependency
    ripgrep # Telescope dependency
  ];

  programs.nixvim = {
    plugins.telescope = {
      enable = true;
      defaults = {
        prompt_prefix = "${icons.ui.Telescope} ";
        selection_caret = "${icons.ui.Forward} ";
      };
      keymapsSilent = true;
      keymaps =
        {
          "<leader>ff" = {
            action = "find_files";
            desc = "Files";
          };
          "<leader>fo" = {
            action = "oldfiles";
            desc = "Old files";
          };
          "<leader>ft" = {
            action = "live_grep";
            desc = "Text";
          };
          "<leader>fr" = {
            action = "resume";
            desc = "Resume";
          };
          "<leader>fb" = {
            action = "buffers";
            desc = "Buffers";
          };
          "<leader>fd" = {
            action = "diagnostics";
            desc = "Diagnostics";
          };
        };
      extraOptions = {
        pickers = {
          buffers = {
            initial_mode = "normal";
          };
        };
      };
    };
  };
}
