{ ... }:

{
  programs.nixvim.plugins = {
    which-key = {
      enable = true;
      registrations = {
        "<leader>b" = "Buffers (Menu)";
        "<leader>d" = "Debug (Menu)";
        "<leader>f" = "Find (Menu)";
        "<leader>g" = "Git (Menu)";
        "<leader>l" = "LSP (Menu)";
        "<leader>m" = "Multicursors (Menu)";
        "<leader>t" = "Terminal (Menu)";
      };
    };
  };
}
