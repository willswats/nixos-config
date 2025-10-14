{ lib
, fetchFromGitHub
, rustPlatform
, withCitation ? true
,
}:

rustPlatform.buildRustPackage {
  pname = "simple-completion-language-server";
  version = "0-unstable-2025-09-30";

  src = fetchFromGitHub {
    owner = "estin";
    repo = "simple-completion-language-server";
    rev = "f017c13cf6df7bf740f8b2c40306259844efb939";
    hash = "sha256-v1/VtuLgFrSO2Xw7vMevBf5jeWpRph6pSiecHsCu8ic=";
  };

  cargoHash = "sha256-tQE/KfvunGUS149UdTAkMa6bmTJqfku6RaaJVQT41Rc=";

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
