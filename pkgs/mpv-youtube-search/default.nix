{ lib, stdenvNoCC, fetchFromGitHub, mpv-user-input }:

stdenvNoCC.mkDerivation rec {
  pname = "mpv-youtube-search";
  version = "unstable-2022-11-20";

  src = fetchFromGitHub {
    owner = "willswats";
    repo = "mpv-youtube-search";
    rev = "9701c02d450c4cec53996b815764e25a76659dff";
    name = pname;
    sha256 = "sha256-kJcPG+lTA/CG0yGU8Ld9W3BkZclRdzk8u7y6VpovSP0=";
  };

  postPatch = ''
    substituteInPlace youtube-search.lua \
      --replace "~~/script-modules/" "${mpv-user-input.src.outPath}/share/mpv/script-modules/"
  '';

  dontBuild = true;

  installPhase = ''
    runHook preInstall
    install -D -t $out/share/mpv/scripts youtube-search.lua
    runHook postInstall
  '';

  passthru.scriptName = "youtube-search.lua";

  meta = with lib; {
    description = "This mpv script uses mpv-user-input to search YouTube.";
    homepage = "https://github.com/willswats/mpv-youtube-search";
    license = licenses.mit;
    platforms = platforms.all;
    # maintainers = with maintainers; [  ];
  };
}
