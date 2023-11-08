{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    enableUpdateCheck = false;
    enableExtensionUpdateCheck = false;
    userSettings = {
      # General
      "window.zoomLevel" = 1;
      "editor.formatOnSave" = true;
      "security.workspace.trust.enabled" = false;
      "window.openFilesInNewWindow" = "default";
      "files.hotExit" = "off";
      "workbench.startupEditor" = "none";
      "window.restoreWindows" = "none";
      # Catppuccin
      "workbench.colorTheme" = "Catppuccin Mocha";
      # Vim
      "vim.useCtrlKeys" = true;
      "vim.useSystemClipboard" = true;
      "vim.insertModeKeyBindings" = [
        {
          "before" = [ "j" "k" ];
          "after" = [ "<Esc>" ];
        }
      ];
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
    ];
  };

  # Set marketplace to the microsoft marketplace instead of open-vsx
  xdg.configFile."VSCodium/product.json" = {
    text = ''
      {
        "extensionsGallery": {
          "serviceUrl": "https://marketplace.visualstudio.com/_apis/public/gallery",
          "cacheUrl": "https://vscode.blob.core.windows.net/gallery/index",
          "itemUrl": "https://marketplace.visualstudio.com/items"
        }
      }
    '';
  };
}
