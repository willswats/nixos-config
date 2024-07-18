{ ... }:

{
  programs.nixvim = {
    plugins.which-key = {
      enable = true;
      registrations = {
        "<leader>b" = "Buffers";
        "<leader>d" = "Debug";
        "<leader>f" = "Find";
        "<leader>g" = "Git";
        "<leader>l" = "LSP";
        "<leader>m" = "Multicursors";
        "<leader>t" = "Terminal";
      };
    };
  };
}
