{ lib, stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "recent-menu";
  version = "unstable-2024-03-22";

  src = fetchFromGitHub {
    owner = "natural-harmonia-gropius";
    repo = "recent-menu";
    rev = "6159d8d5e43f7805f246884930e7e750fe0c2a20";
    name = pname;
    sha256 = "sha256-o9CXIgaEzOm4bRMO6n6aT1xICkC2tRfU4UssxnG4q0E=";
  };

  dontBuild = true;

  installPhase = ''
    runHook preInstall
    install -D -t $out/share/mpv/scripts recentmenu.lua
    runHook postInstall
  '';

  passthru.scriptName = "recentmenu.lua";

  meta = with lib; {
    description = "Recently played menu for mpv.";
    homepage = "https://github.com/natural-harmonia-gropius/recent-menu";
    license = licenses.mit;
    platforms = platforms.all;
    # maintainers = with maintainers; [  ];
  };
}
