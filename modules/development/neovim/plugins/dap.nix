{ config, ... }:

{
  programs.nixvim = {
    keymaps =
      let
        cr = "<CR>";
        cmd = "<CMD>";

        dap = "lua require'dap'";
        dapui = "lua require'dapui'";

        normal =
          let
            mode = "n";
          in
          [
            {
              inherit mode;
              key = "<leader>dt";
              action = "${cmd}${dap}.toggle_breakpoint()${cr}";
              options.desc = "Toggle breakpoint";
            }
            {
              inherit mode;
              key = "<leader>db";
              action = "${cmd}${dap}.step_back()${cr}";
              options.desc = "Step back";
            }
            {
              inherit mode;
              key = "<leader>dc";
              action = "${cmd}${dap}.continue()${cr}";
              options.desc = "Continue";
            }
            {
              inherit mode;
              key = "<leader>dC";
              action = "${cmd}${dap}.run_to_cursor()${cr}";
              options.desc = "Run to cursor";
            }
            {
              inherit mode;
              key = "<leader>dd";
              action = "${cmd}${dap}.disconnect()${cr}";
              options.desc = "Disconnect";
            }
            {
              inherit mode;
              key = "<leader>ds";
              action = "${cmd}${dap}.session()${cr}";
              options.desc = "Get session";
            }
            {
              inherit mode;
              key = "<leader>di";
              action = "${cmd}${dap}.step_into()${cr}";
              options.desc = "Step into";
            }
            {
              inherit mode;
              key = "<leader>do";
              action = "${cmd}${dap}.step_over()${cr}";
              options.desc = "Step over";
            }
            {
              inherit mode;
              key = "<leader>du";
              action = "${cmd}${dap}.step_out()${cr}";
              options.desc = "Step out";
            }
            {
              inherit mode;
              key = "<leader>dp";
              action = "${cmd}${dap}.pause()${cr}";
              options.desc = "Pause";
            }
            {
              inherit mode;
              key = "<leader>dr";
              action = "${cmd}${dap}.repl.toggle()${cr}";
              options.desc = "Toggle REPL";
            }
            {
              inherit mode;
              key = "<leader>dq";
              action = "${cmd}${dap}.close()${cr}";
              options.desc = "Quit";
            }
            {
              inherit mode;
              key = "<leader>dU";
              action = "${cmd}${dapui}.toggle({reset = true})${cr}";
              options.desc = "Toggle UI";
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
      dap-ui = {
        enable = true;
      };
    };
  };
}
