{ fetchFromGitHub, stdenvNoCC, lib, makeWrapper, trash-cli, }:

stdenvNoCC.mkDerivation rec {
  pname = "quick-backup-cli";
  version = "v3.1";

  src = fetchFromGitHub {
    owner = "willswats";
    repo = "quick-backup-cli";
    rev = version;
    hash = "sha256-ZjIKxWbWk+a9gGcYaMqbfR5/PLJdz6GRTp/D2rKPXjU=";
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
