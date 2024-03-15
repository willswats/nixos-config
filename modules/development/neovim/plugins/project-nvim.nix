{ config, ... }:

{
  programs.nixvim = {
    keymaps =
      let
        cr = "<CR>";
        cmd = "<CMD>";

        normal =
          let
            mode = "n";
          in
          [
            {
              inherit mode;
              key = "<leader>p";
              action = "${cmd}ProjectRoot${cr}";
              options.desc = "Project root";
            }
            {
              inherit mode;
              key = "<leader>fp";
              action = "${cmd}Telescope projects${cr}";
              options.desc = "Projects";
            }
          ];
      in
      config.nixvim.helpers.keymaps.mkKeymaps
        {
          options.silent = true;
        }
        (normal);
    plugins = {
      project-nvim = {
        enable = true;
        enableTelescope = true;
        # Manual mode doesn't automatically change your root directory; so you have
        # the option to manually do so using `:ProjectRoot` command.
        manualMode = true;

        # Methods of detecting the root directory. **"lsp"** uses the native neovim
        # lsp; while **"pattern"** uses vim-rooter like glob pattern matching. Here
        # order matters: if one is not detected; the other is used as fallback. You
        # can also delete or rearangne the detection methods.
        detectionMethods = [ "pattern" "lsp" ];

        # All the patterns used to detect root dir; when **"pattern"** is in
        # detection_methods
        patterns = [ ".git" "_darcs" ".hg" ".bzr" ".svn" "Makefile" "package.json" ".project.nvim" ];
      };
    };
  };
}
