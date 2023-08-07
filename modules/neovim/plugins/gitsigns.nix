{ config, ... }:

let icons = import ../icons.nix;
in {
  programs.nixvim = {
    maps =
      let
        cr = "<CR>";
        cmd = "<CMD>";
      in
      config.nixvim.helpers.mkMaps { silent = true; } {
        normal = {
          "<leader>gj".action =
            "${cmd}lua require 'gitsigns'.next_hunk({navigation_message = false})${cr}";
          "<leader>gk".action =
            "${cmd}lua require 'gitsigns'.prev_hunk({navigation_message = false})${cr}";
          "<leader>gr" = "${cmd}lua require 'gitsigns'.reset_hunk()${cr}";
          "<leader>gR" = "${cmd}lua require 'gitsigns'.reset_buffer()${cr}";
          "<leader>gs" = "${cmd}lua require 'gitsigns'.stage_hunk()${cr}";
          "<leader>gS" = "${cmd}lua require 'gitsigns'.undo_stage_hunk()${cr}";
        };
      };
    plugins.gitsigns = {
      enable = true;
      signs = {
        add.text = icons.ui.LineLeft;
        change.text = icons.ui.LineLeft;
        delete.text = icons.ui.TriangleShortArrowRight;
        topdelete.text = icons.ui.TriangleShortArrowRight;
        changedelete.text = icons.ui.LineLeft;
      };
    };
  };
}
