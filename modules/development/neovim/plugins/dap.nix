{ config, ... }:

{
  programs.nixvim = {
    maps =
      let
        cr = "<CR>";
        cmd = "<CMD>";
        dap = "lua require'dap'";
        dapui = "lua require'dapui'";
      in
      config.nixvim.helpers.mkMaps { silent = true; } {
        normal = {
          "<leader>dt" = {
            action = "${cmd}${dap}.toggle_breakpoint()${cr}";
            desc = "Toggle breakpoint";
          };
          "<leader>db" = {
            action = "${cmd}${dap}.step_back()${cr}";
            desc = "Step back";
          };
          "<leader>dc" = {
            action = "${cmd}${dap}.continue()${cr}";
            desc = "Continue";
          };
          "<leader>dC" = {
            action = "${cmd}${dap}.run_to_cursor()${cr}";
            desc = "Run to cursor";
          };
          "<leader>dd" = {
            action = "${cmd}${dap}.disconnect()${cr}";
            desc = "Disconnect";
          };
          "<leader>ds" = {
            action = "${cmd}${dap}.session()${cr}";
            desc = "Get session";
          };
          "<leader>di" = {
            action = "${cmd}${dap}.step_into()${cr}";
            desc = "Step into";
          };
          "<leader>do" = {
            action = "${cmd}${dap}.step_over()${cr}";
            desc = "Step over";
          };
          "<leader>du" = {
            action = "${cmd}${dap}.step_out()${cr}";
            desc = "Step out";
          };
          "<leader>dp" = {
            action = "${cmd}${dap}.pause()${cr}";
            desc = "Pause";
          };
          "<leader>dr" = {
            action = "${cmd}${dap}.repl.toggle()${cr}";
            desc = "Toggle REPL";
          };
          "<leader>dq" = {
            action = "${cmd}${dap}.close()${cr}";
            desc = "Quit";
          };
          "<leader>dU" = {
            action = "${cmd}${dapui}.toggle({reset = true})${cr}";
            desc = "Toggle UI";
          };
        };
      };
    plugins = {
      dap = {
        enable = true;
        extensions = {
          dap-ui = {
            enable = true;
          };
        };
      };
    };
  };
}
