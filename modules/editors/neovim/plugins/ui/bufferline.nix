{ ... }:

let
  icons = import ../../icons.nix;
in
{
  programs.nixvim.plugins.bufferline = {
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
}
