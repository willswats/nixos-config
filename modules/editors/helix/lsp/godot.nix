{ pkgs, ... }:

{
  programs.helix = {
    extraPackages = with pkgs; [
      netcat
      gdtoolkit_4
    ];
    languages = {
      language = [
        {
          name = "gdscript";
          language-servers = [
            "scls"
            "godot"
          ];
          auto-format = true;
        }
      ];
      language-server.godot = {
        command = "nc";
        args = [
          "127.0.0.1"
          "6005"
        ];
      };
    };
  };

  xdg.configFile."helix/external-snippets.toml".text = ''
    [[sources.paths]] 
    scope = [ "gdscript" ]
    path = "snippets/gdscript.json"
  '';
}
