{ config, ... }:

let icons = import ../icons.nix;
in {
  programs.nixvim = {
    keymaps =
      let
        cr = "<CR>";
        cmd = "<CMD>";

        normal =
          let
            mode = "n";
          in
          [
            {
              inherit mode;
              key = "<leader>gj";
              action = "${cmd}lua require 'gitsigns'.next_hunk({navigation_message = false})${cr}";
              options.desc = "Next hunk";
            }
            {
              inherit mode;
              key = "<leader>gk";
              action = "${cmd}lua require 'gitsigns'.prev_hunk({navigation_message = false})${cr}";
              options.desc = "Prev hunk";
            }
            {
              inherit mode;
              key = "<leader>gr";
              action = "${cmd}lua require 'gitsigns'.reset_hunk()${cr}";
              options.desc = "Reset hunk";
            }
            {
              inherit mode;
              key = "<leader>gR";
              action = "${cmd}lua require 'gitsigns'.reset_buffer()${cr}";
              options.desc = "Reset buffer";
            }
            {
              inherit mode;
              key = "<leader>gs";
              action = "${cmd}lua require 'gitsigns'.stage_hunk()${cr}";
              options.desc = "Stage hunk";
            }
            {
              inherit mode;
              key = "<leader>gS";
              action = "${cmd}lua require 'gitsigns'.undo_stage_hunk()${cr}";
              options.desc = "Undo stage hunk";
            }
          ];
      in
      config.nixvim.helpers.keymaps.mkKeymaps
        {
          options.silent = true;
        }
        (normal);

    plugins.gitsigns = {
      enable = true;
      settings.signs = {
        add.text = icons.ui.LineLeft;
        change.text = icons.ui.LineLeft;
        delete.text = icons.ui.TriangleShortArrowRight;
        topdelete.text = icons.ui.TriangleShortArrowRight;
        changedelete.text = icons.ui.LineLeft;
      };
    };
  };
}
