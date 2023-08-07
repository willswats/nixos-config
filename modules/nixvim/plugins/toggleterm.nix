{ ... }:

{
  programs.nixvim = {
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
