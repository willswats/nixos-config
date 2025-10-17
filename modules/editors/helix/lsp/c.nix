{ pkgs, lib, ... }:

{
  programs.helix = {
    extraPackages = with pkgs; [
      clang-tools
    ];
    languages = {
      language = [
        {
          name = "c";
          language-servers = [ "clangd" "scls" ];
        }
        {
          name = "cpp";
          language-servers = [ "clangd" "scls" ];
        }
      ];
    };
  };

  xdg.configFile."helix/external-snippets.toml".text = lib.mkAfter ''
    [[sources.paths]] 
    scope = [ "c" ]  
    path = "snippets/c/c.json"    

    [[sources.paths]] 
    scope = [ "cpp" ]  
    path = "snippets/cpp/cpp.json"    
  '';
}
