{ pkgs, config, ... }:

let icons = import ../icons.nix;
in {
  programs.nixvim = {
    extraPlugins = with pkgs.vimPlugins; [ friendly-snippets ];
    plugins = {
      cmp-nvim-lsp.enable = true;
      cmp-buffer.enable = true;
      cmp-path.enable = true;
      cmp-nvim-lua.enable = true;
      cmp_luasnip.enable = true;
      luasnip = {
        enable = true;
        fromVscode = [
          { } # generates: require("luasnip.loaders.from_vscode").lazy_load({})
        ];
      };

      nvim-cmp = {
        enable = true;
        snippet.expand = "luasnip";
        mapping = {
          "<C-k>" = "cmp.mapping.scroll_docs(-4)";
          "<C-j>" = "cmp.mapping.scroll_docs(4)";
          "<C-Space>" = "cmp.mapping.complete()";
          "<C-e>" = "cmp.mapping.close()";
          "<Tab>" = {
            action = ''
              function(fallback)
                local luasnip = require("luasnip")
                if cmp.visible() then
                  cmp.select_next_item()
                elseif luasnip.expand_or_jumpable() then
                  luasnip.expand_or_jump()
                else
                  fallback()
                end
              end
            '';
            modes = [ "i" "s" ];
          };
          "<S-Tab>" = {
            action = ''
              function(fallback)
                local luasnip = require("luasnip")
                if cmp.visible() then
                  cmp.select_prev_item()
                elseif luasnip.jumpable(-1) then
                  luasnip.jump(-1)
                else
                  fallback()
                end
              end
            '';
            modes = [ "i" "s" ];
          };
          "<CR>" = "cmp.mapping.confirm({ select = false })";
        };
        formatting = {
          fields = [ "abbr" "kind" "menu" ];
          format = ''
            function(_, vim_item)
              icons_kind = ${config.nixvim.helpers.toLuaObject icons.kind}
              vim_item.kind = (icons_kind[vim_item.kind] or "") .. " " .. vim_item.kind
              return vim_item
            end
          '';
        };
        sources = [
          { name = "nvim_lsp"; }
          { name = "nvim_lua"; }
          { name = "luasnip"; }
          { name = "buffer"; }
          { name = "path"; }
        ];
      };
    };
  };
}
