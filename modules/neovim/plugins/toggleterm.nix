{ config, ... }:

{
  programs.nixvim = {
    maps =
      let
        cr = "<CR>";
        cmd = "<CMD>";
      in
      config.nixvim.helpers.mkMaps { silent = true; } {
        normal = {
          "<leader>t1".action = "${cmd}ToggleTerm 1${cr}";
          "<leader>t2".action = "${cmd}ToggleTerm 2${cr}";
          "<leader>t3".action = "${cmd}ToggleTerm 3${cr}";
          "<leader>t4".action = "${cmd}ToggleTerm 4${cr}";
          "<leader>t5".action = "${cmd}ToggleTerm 5${cr}";
          "<leader>t6".action = "${cmd}ToggleTerm 6${cr}";
          "<leader>t7".action = "${cmd}ToggleTerm 7${cr}";
          "<leader>t8".action = "${cmd}ToggleTerm 8${cr}";
          "<leader>t9".action = "${cmd}ToggleTerm 9${cr}";
          "<leader>t0".action = "${cmd}ToggleTerm 10${cr}";
          "<leader>tg".action = "${cmd}lua LAZYGIT_TOGGLE()${cr}";
        };
      };
    plugins.toggleterm = {
      enable = true;
      autochdir =
        true; # When neovim changes it current directory the terminal will change it’s own when next it’s opened
      openMapping = "<c-t>"; # Mapping to open the terminal
      direction = "float"; # Floating terminal
      floatOpts = { border = "single"; }; # Floating terminal options
    };
    extraConfigLua = ''
      local toggleterm_terminal = require("toggleterm.terminal")

      function LAZYGIT_TOGGLE()
        local Terminal = toggleterm_terminal.Terminal
        local lazygit = Terminal:new({
          cmd = "lazygit",
          count = 100
        })
        lazygit:toggle()
      end
    '';
  };
}
