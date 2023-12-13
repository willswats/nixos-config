{ pkgs, ... }:

{
  home.packages = with pkgs; [
    imv
  ];

  # https://git.sr.ht/~exec64/imv/tree/master/item/files/imv-dir.desktop
  home.file.".local/share/applications/imv-dir.desktop".text =
    ''
      [Desktop Entry]
      Name=imv-dir
      Name[en_US]=imv-dir
      GenericName=Image viewer
      GenericName[en_US]=Image viewer
      Comment=Fast freeimage-based Image Viewer | Open all images in a directory
      Exec=imv-dir %F
      NoDisplay=true
      Terminal=false
      Type=Application
      Categories=Graphics;2DGraphics;Viewer;
      MimeType=image/bmp;image/gif;image/jpeg;image/jpg;image/pjpeg;image/png;image/tiff;image/x-bmp;image/x-pcx;image/x-png;image/x-portable-anymap;image/x-portable-bitmap;image/x-portable-graymap;image/x-portable-pixmap;image/x-tga;image/x-xbitmap;
      Icon=multimedia-photo-viewer
      Keywords=photo;picture;
    '';

  xdg.mimeApps = {
    defaultApplications = {
      "image/png" = [ "imv-dir.desktop" ]; # jpg
      "image/jpeg" = [ "imv-dir.desktop" ]; # png
    };
  };
}
