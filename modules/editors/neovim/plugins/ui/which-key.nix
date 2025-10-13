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
            __unkeyed-1 = "<leader>G";
            desc = "Debug";
          }
          {
            __unkeyed-1 = "<leader>g";
            desc = "Git";
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
