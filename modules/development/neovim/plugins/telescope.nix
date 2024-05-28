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
      settings.defaults = {
        prompt_prefix = "${icons.ui.Telescope} ";
        selection_caret = "${icons.ui.Forward} ";
      };
      keymaps =
        {
          "<leader>ff" = {
            action = "find_files";
            options.desc = "Files";
          };
          "<leader>fo" = {
            action = "oldfiles";
            options.desc = "Old files";
          };
          "<leader>ft" = {
            action = "live_grep";
            options.desc = "Text";
          };
          "<leader>fr" = {
            action = "resume";
            options.desc = "Resume";
          };
          "<leader>fb" = {
            action = "buffers";
            options.desc = "Buffers";
          };
          "<leader>fd" = {
            action = "diagnostics";
            options.desc = "Diagnostics";
          };
        };
    };
  };
}
