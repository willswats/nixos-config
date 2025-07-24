{ stdenvNoCC
, lib
, python3
, fetchFromGitHub
, makeWrapper
, vpkedit
,
}:

let
  pythonEnv = python3.withPackages (ps: [
    ps.pyinotify
    ps.pyasyncore
  ]);
in
stdenvNoCC.mkDerivation rec {
  pname = "bsp-extractor";
  version = "unstable-2025-06-22";

  src = fetchFromGitHub {
    owner = "Gedweb";
    repo = "Source-Linux-BSP-Case-Folding";
    rev = "b0040b92dbd526193c9a3d2dd9d076b9da21e19e";
    sha256 = "sha256-W7bJc+CVab0Mtbiw9sNZj5FUDtOZsNJgdcP9EJwmYLc=";
  };
  nativeBuildInputs = [ makeWrapper ];
  buildInputs = [ vpkedit ];
  dontBuild = true;

  installPhase = ''
    runHook preInstall

    install -Dm755 $src/bsp-extractor.py $out/libexec/bsp-extractor.py

    makeWrapper ${pythonEnv.interpreter} $out/bin/bsp-extractor \
      --add-flags "$out/libexec/bsp-extractor.py" \
      --argv0 "bsp-extractor" \
      --prefix PATH : "${lib.makeBinPath [ vpkedit ]}"

    runHook postInstall
  '';

  meta = with lib; {
    description = "A Python utility for automatically extracting and processing BSP game map files. It monitors directory for new BSP files, extracts their contents, and synchronizes assets.";
    homepage = "https://github.com/Gedweb/Source-Linux-BSP-Case-Folding";
    license = licenses.mit;
    maintainers = with maintainers; [ willswats ];
    platforms = platforms.linux;
  };
}
