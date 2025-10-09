{ ... }:

{
  programs.nixvim = {
    plugins.which-key = {
      enable = true;
      settings = {
        delay = 0;
        preset = "helix";
        icons = {
          mappings = false;
          rules = false;
        };
        spec = [
          {
            __unkeyed-1 = "<leader>b";
            desc = "Buffers";
          }
          {
            __unkeyed-1 = "<leader>d";
            desc = "Debug";
          }
          {
            __unkeyed-1 = "<leader>f";
            desc = "Find";
          }
          {
            __unkeyed-1 = "<leader>g";
            desc = "Git";
          }
          {
            __unkeyed-1 = "<leader>l";
            desc = "LSP";
          }
          {
            __unkeyed-1 = "<leader>m";
            desc = "Multicursors";
          }
          {
            __unkeyed-1 = "<leader>t";
            desc = "Terminal";
          }
        ];
      };
    };
  };
}
