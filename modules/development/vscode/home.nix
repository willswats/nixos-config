{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    userSettings = {
      "workbench.colorTheme" = "Catppuccin Mocha";
      "window.zoomLevel" = 1;
      "editor.formatOnSave" = true;
      "vim.useCtrlKeys" = true;
      "vim.useSystemClipboard" = false;
      "vim.insertModeKeyBindings" = [
        {
          "before" = [ "j" "k" ];
          "after" = [ "<Esc>" ];
        }
      ];
      "omnisharp.useModernNet" = false;
      "omnisharp.path" = "${pkgs.omnisharp-roslyn}/bin/OmniSharp";
      "omnisharp.sdkPath" = "${pkgs.dotnet-sdk}";
      "omnisharp.dotnetPath" = "${pkgs.dotnet-sdk}/bin/dotnet";
      "omnisharp.monoPath" = "${pkgs.mono}/bin/mono";
    };
    keybindings = [
      {
        "key" = "ctrl+tab";
        "command" = "workbench.action.nextEditor";
        "when" = "!activeEditorGroupEmpty";
      }
      {
        "key" = "ctrl+shift+tab";
        "command" = "workbench.action.previousEditor";
        "when" = "!activeEditorGroupEmpty";
      }
    ];
    extensions = with pkgs.vscode-extensions; [
      catppuccin.catppuccin-vsc
      vscodevim.vim
      ms-dotnettools.csharp
    ];
  };
}
