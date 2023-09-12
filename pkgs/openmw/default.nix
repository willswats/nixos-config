# https://github.com/NixOS/nixpkgs/pull/245433
{ lib
, stdenv
, mkDerivation
, fetchFromGitHub
, fetchpatch
, cmake
, pkg-config
, wrapQtAppsHook
, openscenegraph
, mygui
, bullet
, ffmpeg
, boost
, SDL2
, unshield
, openal
, libXt
, lz4
, recastnavigation
, VideoDecodeAcceleration
, libyamlcpp
, luajit
}:

let
  openscenegraph_openmw = (openscenegraph.override { colladaSupport = true; });

  bullet_openmw = bullet.overrideDerivation (old: rec {
    cmakeFlags = (old.cmakeFlags or [ ]) ++ [
      "-DUSE_DOUBLE_PRECISION=ON"
      "-DBULLET2_MULTITHREADING=ON"
    ];
  });

in
mkDerivation rec {
  pname = "openmw";
  version = "0.48.0";

  src = fetchFromGitHub {
    owner = "OpenMW";
    repo = "openmw";
    rev = "${pname}-${version}";
    sha256 = "sha256-zkjVt3GfQZsFXl2Ht3lCuQtDMYQWxhdFO4aGSb3rsyo=";
  };

  nativeBuildInputs = [ cmake pkg-config wrapQtAppsHook ];

  # If not set, OSG plugin .so files become shell scripts on Darwin.
  dontWrapQtApps = true;

  buildInputs = [
    SDL2
    boost
    bullet_openmw
    ffmpeg
    libXt
    mygui
    openal
    openscenegraph_openmw
    unshield
    lz4
    recastnavigation
    libyamlcpp
    luajit
  ] ++ lib.optionals stdenv.isDarwin [
    VideoDecodeAcceleration
  ];

  cmakeFlags = [
    # as of 0.46, openmw is broken with GLVND
    "-DOpenGL_GL_PREFERENCE=LEGACY"
    "-DOPENMW_USE_SYSTEM_RECASTNAVIGATION=1"
  ] ++ lib.optionals stdenv.isDarwin [
    "-DOPENMW_OSX_DEPLOYMENT=ON"
  ];

  meta = with lib; {
    description = "An unofficial open source engine reimplementation of the game Morrowind";
    homepage = "https://openmw.org";
    license = licenses.gpl3Plus;
    maintainers = with maintainers; [ abbradar marius851000 ];
    platforms = platforms.linux ++ platforms.darwin;
  };
}
