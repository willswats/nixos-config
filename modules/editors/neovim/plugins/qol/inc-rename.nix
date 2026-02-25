{ ... }:

{
  programs.nixvim = {
    plugins = {
      inc-rename = {
        enable = true;
        settings.show_message = true;
      };
    };

    # Fill in the word under the cursor
    extraConfigLua = ''
      vim.keymap.set("n", "<leader>r", function()
        return ":IncRename " .. vim.fn.expand("<cword>")
      end, { expr = true, desc = "Rename" })
    '';
  };
}
