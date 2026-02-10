{ lib
, fetchFromGitHub
, rustPlatform
, withCitation ? true
,
}:

rustPlatform.buildRustPackage {
  pname = "simple-completion-language-server";
  version = "0-unstable-2026-02-10";

  src = fetchFromGitHub {
    owner = "estin";
    repo = "simple-completion-language-server";
    rev = "6eb0f752e09ffc39c8f01f821f1d7059dddd930d";
    hash = "sha256-4hoBJ2g4sTkCAGCzFGGaIX5Q2OaH+vH25dkm9wR+ZRE=";
  };

  cargoHash = "sha256-aUvdsrnrwRiBj9OTBKqpBwOpty2nJa7FnnI/xOJ0ErA=";

  buildFeatures = lib.optional withCitation [ "citation" ];

  meta = {
    description = "Language server to enable word completion and snippets for Helix editor";
    homepage = "https://github.com/estin/simple-completion-language-server";
    license = [ lib.licenses.mit ];
    maintainers = [ lib.maintainers.kpbaks ];
    mainProgram = "simple-completion-language-server";
    platforms = lib.platforms.all;
  };
}
