{ lib, stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "mpv-youtube-search";
  version = "unstable-2022-11-20";

  srcs = [
    (fetchFromGitHub {
      owner = "CogentRedTester";
      repo = "mpv-user-input";
      rev = "2b4de99560eeba90e3553c85825ffc24d3855df4";
      name = "mpv-user-input";
      sha256 = "sha256-X8N16aJZ7b0yFEn7JydHy9AfAx+54UdZ/MsrKIl3mlk=";
    })
    (fetchFromGitHub {
      owner = "willswats";
      repo = "mpv-youtube-search";
      rev = "9701c02d450c4cec53996b815764e25a76659dff";
      name = pname;
      sha256 = "sha256-kJcPG+lTA/CG0yGU8Ld9W3BkZclRdzk8u7y6VpovSP0=";
    })
  ];

  sourceRoot = ".";

  postPatch = ''
    export srcRoot=`pwd`
    export youtubeSearchSrc="$srcRoot/mpv-youtube-search"
    substituteInPlace $youtubeSearchSrc/youtube-search.lua \
      --replace "~~/script-modules/" "$out/share/mpv/script-modules/"
  '';

  dontBuild = true;

  installPhase = ''
    runHook preInstall
    export srcRoot=`pwd`
    export userInputSrc="$srcRoot/mpv-user-input"
    export youtubeSearchSrc="$srcRoot/mpv-youtube-search"
    install -D -t $out/share/mpv/scripts $userInputSrc/user-input.lua
    install -D -t $out/share/mpv/script-modules $userInputSrc/user-input-module.lua
    install -D -t $out/share/mpv/scripts $youtubeSearchSrc/youtube-search.lua
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
