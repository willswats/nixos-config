{ config, ... }:

{
  programs.nixvim = {
    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };

    keymaps =
      let
        cr = "<CR>";
        cmd = "<CMD>";

        normal =
          let
            mode = "n";
          in
          [
            # Resize with arrow keys
            {
              inherit mode;
              key = "<C-Up>";
              action = ":resize +2${cr}";
            }
            {
              inherit mode;
              key = "<C-Down>";
              action = ":resize -2${cr}";
            }
            {
              inherit mode;
              key = "<C-Left>";
              action = ":vertical resize -2${cr}";
            }
            {
              inherit mode;
              key = "<C-Right>";
              action = ":vertical resize +2${cr}";
            }
            # Remove man bind
            {
              inherit mode;
              key = "K";
              action = "<Nop>";
            }
            # Write and write format
            {
              inherit mode;
              key = "<leader>w";
              action = "${cmd}w!${cr}";
              options.desc = "Write format";
            }
            {
              inherit mode;
              key = "<leader>W";
              action = "${cmd}noautocmd w${cr}";
              options.desc = "Write";
            }
            # Quit
            {
              inherit mode;
              key = "<leader>q";
              action = "${cmd}confirm q${cr}";
              options.desc = "Quit";
            }
            # Buffers
            {
              inherit mode;
              key = "<leader>c";
              action = "${cmd}confirm bd${cr}";
              options.desc = "Close buffer";
            }
            {
              inherit mode;
              key = "<leader>C";
              action = "${cmd}%bd|e#|bd#${cr}";
              options.desc = "Close all buffers but current";
            }
            {
              inherit mode;
              key = "gp";
              action = "${cmd}bp${cr}";
              options.desc = "Goto previous buffer";
            }
            {
              inherit mode;
              key = "gn";
              action = "${cmd}bn${cr}";
              options.desc = "Goto next buffer";
            }
            # Remove highlight
            {
              inherit mode;
              key = "<esc>";
              action = "${cmd}nohlsearch${cr}";
            }
            {
              inherit mode;
              key = ";";
              action = "${cmd}nohlsearch${cr}";
              options.desc = "No highlight";
            }
            # Refresh file
            {
              inherit mode;
              key = "<C-r>";
              action = "${cmd}checktime${cr}";
              options.desc = "Refresh";
            }
            # Helix keymaps
            {
              inherit mode;
              key = "U";
              action = "${cmd}redo${cr}";
            }
            {
              inherit mode;
              key = "gh";
              action = "0";
              options.desc = "Goto line start";
            }
            {
              inherit mode;
              key = "gs";
              action = "\^";
              options.desc = "Goto first non-blank in line";
            }
            {
              inherit mode;
              key = "gl";
              action = "\$";
              options.desc = "Goto line end";
            }
            {
              inherit mode;
              key = "ge";
              action = "G";
              options.desc = "Goto last line";
            }
            {
              key = "mm";
              action = "\%";
              options.desc = "Goto matching bracket";
            }
          ];

        insert =
          let
            mode = "i";
          in
          [
            # Escape insert mode
            {
              inherit mode;
              key = "jk";
              action = "<ESC>";
            }
            {
              inherit mode;
              key = "kj";
              action = "<ESC>";
            }
          ];

        visual =
          let
            mode = "v";
          in
          [
            # Stay in indent mode
            {
              inherit mode;
              key = "<";
              action = "<gv";
            }
            {
              inherit mode;
              key = ">";
              action = ">gv";
            }
            # Remove man bind
            {
              inherit mode;
              key = "K";
              action = "<Nop>";
            }
            # Keep same copy contents when pasting over text
            {
              inherit mode;
              key = "p";
              action = "\"_dP";
            }
            # Helix keymaps
            {
              inherit mode;
              key = "gh";
              action = "0";
              options.desc = "Goto line start";
            }
            {
              inherit mode;
              key = "gs";
              action = "\^";
              options.desc = "Goto first non-blank in line";
            }
            {
              inherit mode;
              key = "gl";
              action = "\$";
              options.desc = "Goto line end";
            }
            {
              inherit mode;
              key = "ge";
              action = "G";
              options.desc = "Goto last line";
            }
            {
              key = "mm";
              action = "\%";
              options.desc = "Goto matching bracket";
            }
          ];

        terminal =
          let
            mode = "t";
          in
          [
            # Better terminal navigation
            {
              inherit mode;
              key = "<C-h>";
              action = "<C-\\><C-N><C-w>h";
            }
            {
              inherit mode;
              key = "<C-j>";
              action = "<C-\\><C-N><C-w>j";
            }
            {

              inherit mode;
              key = "<C-k>";
              action = "<C-\\><C-N><C-w>k";
            }
            {
              inherit mode;
              key = "<C-l>";
              action = "<C-\\><C-N><C-w>h";
            }
          ];
      in
      config.lib.nixvim.keymaps.mkKeymaps {
        options.silent = true;
      } (normal ++ insert ++ visual ++ terminal);
  };
}
