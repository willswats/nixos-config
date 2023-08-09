{ pkgs, ... }:

{
  programs.nixvim = {
    extraPlugins = with pkgs.vimPlugins; [ friendly-snippets ];
    plugins = {
      cmp-nvim-lsp.enable = true;
      cmp-buffer.enable = true;
      cmp-path.enable = true;
      cmp-nvim-lua.enable = true;
      cmp_luasnip.enable = true;
      luasnip.enable = true;

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
                elseif has_words_before() then
                  cmp.complete()
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
              vim_item.kind = (icons.kind[vim_item.kind] or "") .. " " .. vim_item.kind
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
    extraConfigLuaPre = ''
      local function has_words_before()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
      end
    '';
    extraConfigLuaPost = ''
      require("luasnip.loaders.from_vscode").lazy_load()
    '';
    extraConfigLua = ''
      icons = {
        kind = {
          Array = "",
          Boolean = "",
          Class = "",
          Color = "",
          Constant = "",
          Constructor = "",
          Enum = "",
          EnumMember = "",
          Event = "",
          Field = "",
          File = "",
          Folder = "󰉋",
          Function = "",
          Interface = "",
          Key = "",
          Keyword = "",
          Method = "",
          Module = "",
          Namespace = "",
          Null = "󰟢",
          Number = "",
          Object = "",
          Operator = "",
          Package = "",
          Property = "",
          Reference = "",
          Snippet = "",
          String = "",
          Struct = "",
          Text = "",
          TypeParameter = "",
          Unit = "",
          Value = "",
          Variable = "",
        },
      }
    '';
  };
}
