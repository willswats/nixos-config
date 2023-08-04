{ pkgs, ... }:

{
  home.packages = with pkgs;
    [
      trash-cli # Removal command in nvim-tree
    ];

  programs.nixvim.plugins.nvim-tree = {
    enable = true;
    disableNetrw = false;
    view = {
      float = {
        enable = true;
        openWinConfig = {
          relative = "editor";
          border = "rounded";
          width = 40;
          height = 100000;
        };
      };
    };
    trash.cmd = "trash";
  };
}
