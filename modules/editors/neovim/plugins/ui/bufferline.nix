{ config, ... }:

let
  icons = import ../../icons.nix;
in
{
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
              key = "<S-j>";
              action = "${cmd}BufferLineCyclePrev${cr}";
            }
            {
              inherit mode;
              key = "<S-k>";
              action = "${cmd}BufferLineCycleNext${cr}";
            }
            {
              inherit mode;
              key = "<A-j>";
              action = "${cmd}BufferLineMovePrev${cr}";
            }
            {
              inherit mode;
              key = "<A-k>";
              action = "${cmd}BufferLineMoveNext${cr}";
            }
            {
              inherit mode;
              key = "<leader>bh";
              action = "${cmd}BufferLineCloseLeft${cr}";
              options.desc = "Close left";
            }
            {
              inherit mode;
              key = "<leader>bl";
              action = "${cmd}BufferLineCloseRight${cr}";
              options.desc = "Close right";
            }
            {
              inherit mode;
              key = "<leader>bo";
              action = "${cmd}BufferLineCloseOthers${cr}";
              options.desc = "Close others";
            }
            {
              inherit mode;
              key = "<leader>bp";
              action = "${cmd}BufferLinePick${cr}";
              options.desc = "Pick";
            }
            {
              inherit mode;
              key = "<leader>bP";
              action = "${cmd}BufferLinePickClose${cr}";
              options.desc = "Pick close";
            }
          ];
      in
      config.lib.nixvim.keymaps.mkKeymaps {
        options.silent = true;
      } (normal);

    plugins.bufferline = {
      enable = true;
      settings.options = {
        always_show_bufferline = false;
        buffer_close_icon = icons.ui.Close;
        close_icon = icons.ui.BoldClose;
        diagnostics = "nvim_lsp";
        diagnostics_indicator = ''
          function(count, level)
            local icon = ""
            if level:match("error") then
              icon = "${icons.diagnostics.Error}"
            elseif level:match("warning") then
              icon = "${icons.diagnostics.Warning}"
            elseif level:match("hint") then
              icon = "${icons.diagnostics.Hint}"
            end
            return " " .. icon .. " " .. count
          end
        '';
        indicator.icon = icons.ui.BoldLineLeft;
        left_trunc_marker = icons.ui.ArrowCircleLeft;
        modified_icon = icons.ui.Circle;
        right_trunc_Marker = icons.ui.ArrowCircleRight;
        close_command = "confirm bdelete %d";
        right_mouse_command = "confirm bdelete %d";
        show_buffer_close_icons = false;
        show_tab_indicators = false;
      };
    };
  };
}
