{
  fetchFromGitHub,
  stdenvNoCC,
  lib,
  buildFHSEnv,
  curl,
  inotify-tools,
  libnotify,
  parallel,
  rsync,
  unzip,
  vpkedit,
}:

let
  name = "lbspcfw";
  pname = "linux-bsp-casefolding-workaround-app";
  version = "v1.04";

  lbspcfw = stdenvNoCC.mkDerivation rec {
    inherit pname version;

    src = fetchFromGitHub {
      owner = "scorpius2k1";
      repo = "linux-bsp-casefolding-workaround";
      rev = version;
      hash = "sha256-pjLXclqpJVsNx0EEJX9abVMFA3k0f+q52Fgduxz+ttY=";
    };

    installPhase = ''
      runHook preInstall
      install -Dm755 lbspcfw.sh $out/bin/lbspcfw
      cp -r mod $out/bin/mod
      runHook postInstall
    '';

    postPatch = ''
      substituteInPlace lbspcfw.sh \
        --replace 'declare path_script="$(dirname "$(realpath "$0")")"' \
                  'declare path_script="$(dirname "$(realpath "$0")")"
                  declare state_dir="''${LBSFCFW_STATE_DIR:-''${XDG_STATE_HOME:-$HOME/.local/state}/lbspcfw}"
                  mkdir -p "$state_dir"'

      # Redirect each writable path to state_dir
      for path in bsp cfg data hash log sync; do
        substituteInPlace lbspcfw.sh \
          --replace "path_$path=\"\$path_script" "path_$path=\"\$state_dir"
      done

      # Replace the vpkedit path with the nixpkgs one
      substituteInPlace mod/process.sh \
        --replace 'export path_vpkcli="''${command_run[vpkeditcli]}"' \
                  'export path_vpkcli="${vpkedit}/bin/vpkeditcli"'

      # Don't checkvpk or checkupdate
      substituteInPlace lbspcfw.sh \
        --replace "checkupdate" "" \
        --replace "checkvpk" ""

    '';
  };

in
buildFHSEnv {
  inherit name version;

  targetPkgs = pkgs: [
    curl
    inotify-tools
    libnotify
    parallel
    rsync
    unzip
    vpkedit
    lbspcfw
  ];

  runScript = name;

  meta = with lib; {
    homepage = "https://github.com/scorpius2k1/linux-bsp-casefolding-workaround";
    description = "Workaround for case folding issues for BSP map files with custom assets in Steam games on Linux";
    license = licenses.gpl3Plus;
    platforms = platforms.unix;
    maintainers = with maintainers; [ willswats ];
  };
}
