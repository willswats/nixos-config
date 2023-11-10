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
              key = "<A-k>";
              action = "${cmd}BufferLineMoveNext${cr}";
            }
            {
              inherit mode;
              key = "<A-j>";
              action = "${cmd}BufferLineMovePrev${cr}";
            }
            {
              inherit mode;
              key = "<leader>bh";
              action = "${cmd}BufferLineCloseLeft${cr}";
              options.desc = "Delete left";
            }
            {
              inherit mode;
              key = "<leader>bl";
              action = "${cmd}BufferLineCloseRight${cr}";
              options.desc = "Delete right";
            }
          ];
      in
      config.nixvim.helpers.keymaps.mkKeymaps
        {
          options.silent = true;
        }
        (normal);

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
