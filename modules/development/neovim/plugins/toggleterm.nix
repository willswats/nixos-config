{ config, ... }:

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
              key = "<leader>t1";
              action = "${cmd}ToggleTerm 1${cr}";
              options.desc = "1";
            }
            {
              inherit mode;
              key = "<leader>t2";
              action = "${cmd}ToggleTerm 2${cr}";
              options.desc = "2";
            }
            {
              inherit mode;
              key = "<leader>t3";
              action = "${cmd}ToggleTerm 3${cr}";
              options.desc = "3";
            }
            {
              inherit mode;
              key = "<leader>t4";
              action = "${cmd}ToggleTerm 4${cr}";
              options.desc = "4";
            }
            {
              inherit mode;
              key = "<leader>t5";
              action = "${cmd}ToggleTerm 5${cr}";
              options.desc = "5";
            }
            {
              inherit mode;
              key = "<leader>t6";
              action = "${cmd}ToggleTerm 6${cr}";
              options.desc = "6";
            }
            {
              inherit mode;
              key = "<leader>t7";
              action = "${cmd}ToggleTerm 7${cr}";
              options.desc = "7";
            }
            {
              inherit mode;
              key = "<leader>t8";
              action = "${cmd}ToggleTerm 8${cr}";
              options.desc = "8";
            }
            {
              inherit mode;
              key = "<leader>t9";
              action = "${cmd}ToggleTerm 9${cr}";
              options.desc = "9";
            }
            {
              inherit mode;
              key = "<leader>tg";
              action = "${cmd}lua LAZYGIT_TOGGLE()${cr}";
              options.desc = "Lazygit";
            }
            {
              inherit mode;
              key = "<leader>ty";
              action = "${cmd}lua YAZI_TOGGLE()${cr}";
              options.desc = "Yazi";
            }
          ];
      in
      config.nixvim.helpers.keymaps.mkKeymaps
        {
          options.silent = true;
        }
        (normal);

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

      function YAZI_TOGGLE()
        local Terminal = toggleterm_terminal.Terminal
        local yazi = Terminal:new({
          cmd = "yazi",
          count = 101
        })
        yazi:toggle()
      end
    '';
  };
}
