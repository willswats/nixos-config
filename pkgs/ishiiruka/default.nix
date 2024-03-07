{ appimageTools, fetchurl, lib, ... }:

appimageTools.wrapType2 rec {
  pname = "Ishiiruka";
  version = "v3.4.0";

  src = fetchurl {
    url = "https://github.com/project-slippi/Ishiiruka/releases/download/${version}/Slippi_Online-x86_64.AppImage";
    sha256 = "086x9xma75qln08rs28n4m2krcs4w1jcb7jg5hiyslmbanyr06m6";
  };

  extraPkgs = pkgs: with pkgs;  [ gmp mpg123 libmpg123 ];

  meta = with lib; {
    homepage = "https://github.com/project-slippi/Ishiiruka";
    license = licenses.gpl2Plus;
    # maintainers = with maintainers; [ ];
  };
}
