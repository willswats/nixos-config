{ lib, pkgs, ... }:

{

  programs.helix.extraPackages = with pkgs; [
    netcat
    gdtoolkit_4
  ];

  xdg.configFile."helix/languages.toml".text = lib.mkAfter ''
    [language-server.godot]
    command = "nc"
    args = [ "127.0.0.1", "6005"]

    [[language]]
    name = "gdscript"
    language-servers = [ "godot", "scls" ]
    formatter = { command = "gdformat", args = ["-"] }
  '';

  xdg.configFile."helix/external-snippets.toml".text = ''
    [[sources.paths]] 
    scope = [ "gdscript" ]
    path = "snippets/gdscript.json"
  '';
}
