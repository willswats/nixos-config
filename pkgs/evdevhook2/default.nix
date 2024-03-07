# This currently fails due to not handling the subproject: "meson.build:8:17: ERROR: Automatic wrap-based subproject downloading is disabled"
# The subproject is found here: https://github.com/v1993/evdevhook2/blob/main/subprojects/gcemuhook.wrap
# The arch PKGBULD is found here (they download the subproject): https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=evdevhook2-git
{ stdenv
, fetchFromGitHub
, lib
, meson
, vala
, glib
, zlib
, libgee
, libudev-zero
, libevdev
, gcc
, pkg-config
, ninja
, ...
}:

stdenv.mkDerivation rec {
  pname = "v1993";
  version = "v1.0.1";

  src = fetchFromGitHub {
    owner = "v1993";
    repo = "evdevhook2";
    rev = "refs/tags/${version}";
    hash = "sha256-nPVL+lDIPmseWWdzWIem7iey23t5cTCBesMfZ3FNsPU=";
  };

  nativeBuildInputs = [
    meson
    vala
    glib
    zlib
    libgee
    libudev-zero
    libevdev
    gcc
    pkg-config
    ninja
  ];

  meta = with lib; {
    homepage = "https://github.com/v1993/evdevhook2";
    description = "Cemuhook UDP server for devices with modern Linux drivers";
    license = licenses.gpl3Plus;
    # maintainers = with maintainers; [ ];
    platforms = [ "x86_64-linux" "aarch64-linux" ];
  };
}
