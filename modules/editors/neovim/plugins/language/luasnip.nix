{ ... }:

{
  programs.nixvim.plugins.luasnip = {
    enable = true;
    settings = {
      # https://github.com/L3MON4D3/LuaSnip/blob/master/DOC.md
      region_check_events = "InsertEnter";
      delete_check_events = "InsertLeave";
    };
    fromVscode = [
      { } # generates: require("luasnip.loaders.from_vscode").lazy_load({})
    ];
  };
}
