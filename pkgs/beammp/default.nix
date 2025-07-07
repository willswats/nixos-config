{ lib
, fetchFromGitHub
, stdenv
, clang-tools
, cmake
, codespell
, conan
, cppcheck
, doxygen
, gtest
, lcov
, httplib
, nlohmann_json
, zlib
, openssl
, curl
, nss
, cacert
, makeWrapper
,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "beammp";
  version = "2.4.0";

  src = fetchFromGitHub {
    owner = "BeamMP";
    repo = "BeamMP-Launcher";
    tag = "v${finalAttrs.version}";
    hash = "sha256-aAQmgK03a3BY4YWuDyTmJzcePchD74SXfbkHwnaOYW8=";
  };

  nativeBuildInputs = [
    clang-tools
    cmake
    codespell
    conan
    cppcheck
    doxygen
    gtest
    lcov
    makeWrapper
  ];

  buildInputs = [
    httplib
    nlohmann_json
    zlib
    openssl
    curl
    nss
    cacert
  ];

  cmakeFlags = [
    (lib.cmakeBool "ENABLE_VCPKG" false)
  ];

  strictDeps = true;

  installPhase = ''
    runHook preInstall

    mkdir -p $out/bin
    cp ./BeamMP-Launcher $out/bin/BeamMP-Launcher

    wrapProgram $out/bin/BeamMP-Launcher \
      --set SSL_CERT_DIR "${cacert}/etc/ssl/certs"

    runHook postInstall
  '';

  meta = {
    description = "Bringing multiplayer to BeamNG.drive";
    homepage = "https://beammp.com";
    license = with lib.licenses; [ agpl3Only ];
    mainProgram = "beammp";
    maintainers = with lib.maintainers; [
      willswats
    ];
    platforms = [ "x86_64-linux" ];
  };
})
