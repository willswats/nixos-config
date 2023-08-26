{ lib, stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation {
  pname = "mpv-user-input";
  version = "unstable-2023-01-17";

  src = fetchFromGitHub {
    owner = "CogentRedTester";
    repo = "mpv-user-input";
    rev = "2b4de99560eeba90e3553c85825ffc24d3855df4";
    sha256 = "sha256-X8N16aJZ7b0yFEn7JydHy9AfAx+54UdZ/MsrKIl3mlk=";
  };

  dontBuild = true;

  installPhase = ''
    runHook preInstall
    install -D -t $out/share/mpv/scripts user-input.lua
    install -D -t $out/share/mpv/script-modules user-input-module.lua
    runHook postInstall
  '';

  passthru.scriptName = "user-input.lua";

  meta = with lib; {
    description = "API to allow mpv scripts to request user text input ";
    homepage = "https://github.com/CogentRedTester/mpv-user-input";
    license = licenses.mit;
    platforms = platforms.all;
    # maintainers = with maintainers; [  ];
  };
}
