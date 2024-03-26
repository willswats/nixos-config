{ lib, stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "memo";
  version = "unstable-2023-10-31";

  src = fetchFromGitHub {
    owner = "po5";
    repo = "memo";
    rev = "6f2b036ef860e130ea584657389e0a7ceb4d954f";
    name = pname;
    sha256 = "sha256-m8ikXuw7PM4Btg8w7ufLneKA4fnYjMyfVJYueZILMw8=";
  };

  dontBuild = true;

  installPhase = ''
    runHook preInstall
    install -D -t $out/share/mpv/scripts memo.lua
    runHook postInstall
  '';

  passthru.scriptName = "memo.lua";

  meta = with lib; {
    description = "A recent files menu for mpv";
    homepage = "https://github.com/po5/memo";
    license = licenses.gpl3;
    platforms = platforms.all;
    # maintainers = with maintainers; [  ];
  };
}
