{ stdenv
, lib
, fetchgit
, makeWrapper
, pkg-config
, glew
, libX11
, libXcomposite
, glfw
, libpulseaudio
, ffmpeg
, wayland
, libdrm
, libva
, libcap
, libglvnd
, libXrandr
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "gpu-screen-recorder";
  version = "3.0.0";

  src = fetchgit {
    url = "https://repo.dec05eba.com/gpu-screen-recorder";
    rev = "d6cf3b73549f48bb1a640e6359fc45ee776b7188";
    hash = "sha256-5aUmuf2p7lL28OiLkhT+UX0w+K3Vsf/2uPxydj33+5E=";
  };

  nativeBuildInputs = [
    pkg-config
    makeWrapper
  ];

  buildInputs = [
    glew
    libX11
    libXcomposite
    glfw
    libpulseaudio
    ffmpeg
    wayland
    libdrm
    libcap
    libva
    libglvnd
    libXrandr
  ];

  buildPhase = ''
    ./build.sh
  '';

  installPhase = ''
    install -Dt $out/bin gpu-screen-recorder
    install -Dt $out/bin gsr-kms-server
    wrapProgram $out/bin/gpu-screen-recorder --prefix LD_LIBRARY_PATH : ${libglvnd}/lib --prefix PATH : $out/bin
  '';

  meta = with lib; {
    description = "A screen recorder that has minimal impact on system performance by recording a window using the GPU only";
    homepage = "https://git.dec05eba.com/gpu-screen-recorder/about/";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ babbaj keenanweaver ];
    platforms = [ "x86_64-linux" ];
  };
})
