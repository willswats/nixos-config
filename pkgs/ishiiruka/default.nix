{ appimageTools, fetchurl, lib, ... }:

appimageTools.wrapType2 rec {
  pname = "Ishiiruka";
  version = "v3.3.1";

  src = fetchurl {
    url = "https://github.com/project-slippi/Ishiiruka/releases/download/${version}/Slippi_Online-x86_64.AppImage";
    sha256 = "sha256-XX02DcPW/lwExI6ZtxQHnyttkeA9BEy5ERH0g/NtEZY=";
  };

  extraPkgs = pkgs: with pkgs;  [ gmp mpg123 libmpg123 ];

  meta = with lib; {
    homepage = "https://github.com/project-slippi/Ishiiruka";
    license = licenses.gpl2Plus;
    # maintainers = with maintainers; [ ];
  };
}
