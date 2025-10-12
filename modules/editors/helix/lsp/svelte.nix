{ pkgs, lib, ... }:

{
  programs.helix.extraPackages = with pkgs; [
    svelte-language-server
  ];

  xdg.configFile."helix/languages.toml".text = lib.mkAfter ''
    [[language]]
    name = "svelte"
    language-servers = [ "svelteserver", "scls" ]
  '';

  xdg.configFile."helix/external-snippets.toml".text = lib.mkAfter ''
    [[sources.paths]] 
    scope = [ "svelte" ] 
    path = "snippets/svelte.json"
  '';
}
