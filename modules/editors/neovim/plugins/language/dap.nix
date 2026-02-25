{ config, ... }:

{
  programs.nixvim = {
    keymaps =
      let
        cr = "<CR>";
        cmd = "<CMD>";

        dap = "lua require'dap'";

        normal =
          let
            mode = "n";
          in
          [
            {
              inherit mode;
              key = "<leader>Gt";
              action = "${cmd}${dap}.toggle_breakpoint()${cr}";
              options.desc = "Toggle breakpoint";
            }
            {
              inherit mode;
              key = "<leader>Gb";
              action = "${cmd}${dap}.step_back()${cr}";
              options.desc = "Step back";
            }
            {
              inherit mode;
              key = "<leader>Gc";
              action = "${cmd}${dap}.continue()${cr}";
              options.desc = "Continue";
            }
            {
              inherit mode;
              key = "<leader>GC";
              action = "${cmd}${dap}.run_to_cursor()${cr}";
              options.desc = "Run to cursor";
            }
            {
              inherit mode;
              key = "<leader>Gd";
              action = "${cmd}${dap}.disconnect()${cr}";
              options.desc = "Disconnect";
            }
            {
              inherit mode;
              key = "<leader>Gs";
              action = "${cmd}${dap}.session()${cr}";
              options.desc = "Get session";
            }
            {
              inherit mode;
              key = "<leader>Gi";
              action = "${cmd}${dap}.step_into()${cr}";
              options.desc = "Step into";
            }
            {
              inherit mode;
              key = "<leader>Go";
              action = "${cmd}${dap}.step_over()${cr}";
              options.desc = "Step over";
            }
            {
              inherit mode;
              key = "<leader>Gu";
              action = "${cmd}${dap}.step_out()${cr}";
              options.desc = "Step out";
            }
            {
              inherit mode;
              key = "<leader>Gp";
              action = "${cmd}${dap}.pause()${cr}";
              options.desc = "Pause";
            }
            {
              inherit mode;
              key = "<leader>Gr";
              action = "${cmd}${dap}.repl.toggle()${cr}";
              options.desc = "Toggle REPL";
            }
            {
              inherit mode;
              key = "<leader>Gq";
              action = "${cmd}${dap}.close()${cr}";
              options.desc = "Quit";
            }
            {
              inherit mode;
              key = "<leader>Gv";
              action = "${cmd}DapViewOpen${cr}";
              options.desc = "View open";
            }
            {
              inherit mode;
              key = "<leader>GV";
              action = "${cmd}DapViewClose${cr}";
              options.desc = "View close";
            }
          ];
      in
      config.lib.nixvim.keymaps.mkKeymaps
        {
          options.silent = true;
        }
        (normal);

    plugins = {
      dap = {
        enable = true;
      };
      dap-view.enable = true;
    };
  };
}
