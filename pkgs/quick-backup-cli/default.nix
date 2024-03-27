{ fetchFromGitHub, stdenvNoCC, lib, makeWrapper, trash-cli, }:

stdenvNoCC.mkDerivation rec {
  pname = "quick-backup-cli";
  version = "v3.0";

  src = fetchFromGitHub {
    owner = "willswats";
    repo = "quick-backup-cli";
    rev = version;
    hash = "sha256-3o3ZP0N/Qvs374fLec+/uWKKJ9wn+tWEs9QaWg5U3tA=";
  };

  nativeBuildInputs = [ makeWrapper ];
  runtimeDependencies = [ trash-cli ];

  installPhase = ''
    runHook preInstall

    install -Dm755 quick-backup-cli $out/bin/quick-backup-cli

    wrapProgram $out/bin/quick-backup-cli \
       --prefix PATH : ${lib.makeBinPath runtimeDependencies}

    runHook postInstall
  '';

  meta = with lib; {
    homepage = "https://github.com/willswats/quick-backup-cli";
    description = "Quickly copy directories to a specified location, and vice versa.";
    license = licenses.mit;
    platforms = platforms.unix;
  };
}
