{ fetchFromGitHub, stdenvNoCC, lib, makeWrapper, trash-cli, }:

stdenvNoCC.mkDerivation rec {
  pname = "quick-backup-cli";
  version = "v1.6";

  src = fetchFromGitHub {
    owner = "willswats";
    repo = "quick-backup-cli";
    rev = version;
    hash = "sha256-2Q8e5I6XzOpZ94IQFDyX9LaNjStNL03Ujq+FaQbujYM=";
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
    description = "Quickly copy config directories to a specified location, and vice versa.";
    license = licenses.mit;
    platforms = platforms.unix;
  };
}
