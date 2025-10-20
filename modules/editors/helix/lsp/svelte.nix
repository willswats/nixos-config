{ pkgs, lib, ... }:

{

  programs.helix = {
    extraPackages = with pkgs; [
      svelte-language-server
    ];
    languages = {
      language = [{
        name = "svelte";
        language-servers = [ "scls" "svelteserver" ];
        auto-format = true;
      }];
    };
  };

  xdg.configFile."helix/external-snippets.toml".text = lib.mkAfter ''
    [[sources.paths]] 
    scope = [ "svelte" ] 
    path = "snippets/svelte.json"
  '';
}
