{ ... }:

{
  programs.nixvim.plugins.illuminate = {
    enable = true;
    settings.filetypes_denylist = [
      "NvimTree"
      "TelescopePrompt"
      "toggleterm"
    ];
  };
}
