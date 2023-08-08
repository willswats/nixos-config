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
          "<S-l>".action = "${cmd}BufferLineCycleNext${cr}";
          "<S-h>".action = "${cmd}BufferLineCyclePrev${cr}";
          "<A-l>".action = "${cmd}BufferLineMoveNext${cr}";
          "<A-h>".action = "${cmd}BufferLineMovePrev${cr}";
          "<leader>bh".action = "${cmd}BufferLineCloseLeft${cr}";
          "<leader>bl".action = "${cmd}BufferLineCloseRight${cr}";
        };
      };
    plugins.bufferline = {
      enable = true;
      closeCommand = "confirm bdelete %d";
      rightMouseCommand = "confirm bdelete %d";
      showBufferCloseIcons = false;
      alwaysShowBufferline = false;
      indicator.icon = icons.ui.BoldLineLeft;
      bufferCloseIcon = icons.ui.Close;
      modifiedIcon = icons.ui.Circle;
      closeIcon = icons.ui.BoldClose;
      leftTruncMarker = icons.ui.ArrowCircleLeft;
      rightTruncMarker = icons.ui.ArrowCircleRight;
      diagnostics = "nvim_lsp";
      diagnosticsIndicator = ''
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
    };
  };
}
