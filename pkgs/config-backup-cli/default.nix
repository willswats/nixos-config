{ fetchFromGitHub, stdenvNoCC, lib, makeWrapper, trash-cli, }:

stdenvNoCC.mkDerivation rec {
  pname = "config-backup-cli";
  version = "v1.5";

  src = fetchFromGitHub {
    owner = "willswats";
    repo = "config-backup-cli";
    rev = version;
    hash = "sha256-dFtFXPQYy2WCAeDvqFEL9Rw2AbxJTgfwTdCPqrnIwP4=";
  };

  nativeBuildInputs = [ makeWrapper ];
  runtimeDependencies = [ trash-cli ];

  installPhase = ''
    runHook preInstall

    install -Dm755 config-backup-cli $out/bin/config-backup-cli

    wrapProgram $out/bin/config-backup-cli \
       --prefix PATH : ${lib.makeBinPath runtimeDependencies}

    runHook postInstall
  '';

  meta = with lib; {
    homepage = "https://github.com/willswats/config-backup-cli";
    description = "A shell script made for backing up configs to cloud storage.";
    license = licenses.mit;
    platforms = platforms.unix;
  };
}
