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
          "<leader>t1" = {
            action = "${cmd}ToggleTerm 1${cr}";
            desc = "1";
          };
          "<leader>t2" = {
            action = "${cmd}ToggleTerm 2${cr}";
            desc = "2";
          };
          "<leader>t3" = {
            action = "${cmd}ToggleTerm 3${cr}";
            desc = "3";
          };
          "<leader>t4" = {
            action = "${cmd}ToggleTerm 4${cr}";
            desc = "4";
          };
          "<leader>t5" = {
            action = "${cmd}ToggleTerm 5${cr}";
            desc = "5";
          };
          "<leader>t6" = {
            action = "${cmd}ToggleTerm 6${cr}";
            desc = "6";
          };
          "<leader>t7" = {
            action = "${cmd}ToggleTerm 7${cr}";
            desc = "7";
          };
          "<leader>t8" = {
            action = "${cmd}ToggleTerm 8${cr}";
            desc = "8";
          };
          "<leader>t9" = {
            action = "${cmd}ToggleTerm 9${cr}";
            desc = "9";
          };
          "<leader>tg" = { action = "${cmd}lua LAZYGIT_TOGGLE()${cr}"; desc = "Lazygit"; };
        };
      };
    plugins.toggleterm = {
      enable = true;
      autochdir =
        true; # When neovim changes it current directory the terminal will change it’s own when next it’s opened
      openMapping = "<c-\\>"; # Mapping to open the terminal
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
