{ pkgs, ... }:

{
  home.packages = with pkgs; [ f3d ];

  xdg.mimeApps = {
    defaultApplications =
      let
        f3d = "f3d.desktop";
      in
      {
        "model/gltf-binary" = [ f3d ];
      };
  };
}
