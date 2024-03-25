{ lib, stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "SimpleHistory";
  version = "unstable-2023-11-25";

  src = fetchFromGitHub {
    owner = "Eisa01";
    repo = "mpv-scripts";
    rev = "48d68283cea47ff8e904decc9003b3abc3e2123e";
    name = pname;
    sha256 = "sha256-95CAKjBRELX2f7oWSHFWJnI0mikAoxhfUphe9k51Qf4=";
  };

  dontBuild = true;

  installPhase = ''
    runHook preInstall
    install -D -t $out/share/mpv/scripts scripts/SimpleHistory.lua
    runHook postInstall
  '';

  passthru.scriptName = "SimpleHistory.lua";

  meta = with lib; {
    description = "Stores whatever you open in a history file and abuses it with features! Continue watching your last played or resume previously played videos, manage and play from your history, and more...";
    homepage = "https://github.com/Eisa01/mpv-scripts";
    license = licenses.bsd2;
    platforms = platforms.all;
    # maintainers = with maintainers; [  ];
  };
}
