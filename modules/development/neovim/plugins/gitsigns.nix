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
          "<leader>gj" =
            {
              action = "${cmd}lua require 'gitsigns'.next_hunk({navigation_message = false})${cr}";
              desc = "Next hunk";
            };
          "<leader>gk" =
            {
              action = "${cmd}lua require 'gitsigns'.prev_hunk({navigation_message = false})${cr}";
              desc = "Prev hunk";
            };
          "<leader>gr" = {
            action = "${cmd}lua require 'gitsigns'.reset_hunk()${cr}";
            desc = "Reset hunk";
          };
          "<leader>gR" = {
            action = "${cmd}lua require 'gitsigns'.reset_buffer()${cr}";
            desc = "Reset buffer";
          };
          "<leader>gs" = {
            action = "${cmd}lua require 'gitsigns'.stage_hunk()${cr}";
            desc = "Stage hunk";
          };
          "<leader>gS" = {
            action = "${cmd}lua require 'gitsigns'.undo_stage_hunk()${cr}";
            desc = "Undo stage hunk";
          };
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
