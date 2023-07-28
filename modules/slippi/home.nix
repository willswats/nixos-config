{ config, pkgs, ... }:

{
  home.packages =
    [
      (
        let
          user = "project-slippi";
          project = "slippi-launcher";
          assetName = "Slippi-Launcher-${version}-x86_64.AppImage";
          version = "2.10.2"; # Pin the version as each new version will return a different hash
          hash = "0yjzzml59v5b7amlllrv8dhcx4kf52cakbc028bb7xisj7lib73x"; # nix-prefetch-url https://github.com/project-slippi/slippi-launcher/releases/download/v2.10.2/Slippi-Launcher-2.10.2-x86_64.AppImage
        in
        pkgs.appimageTools.wrapType2
          {
            name = "slippi-launcher";
            src = builtins.fetchurl {
              url = "https://github.com/${user}/${project}/releases/download/v${version}/${assetName}";
              sha256 = "${hash}";
            };
          }
      )
      (
        let
          user = "project-slippi";
          project = "Ishiiruka";
          assetName = "Slippi_Online-x86_64.AppImage";
          version = "3.1.0"; # Pin the version as each new version will return a different hash
          hash = "039qm941xbl97zvvv0q6480fps4w1a0n71sk1wiacs6n4gm2bs6f"; # nix-prefetch-url nix-prefetch-url https://github.com/project-slippi/Ishiiruka/releases/download/v3.1.0/Slippi_Online-x86_64.AppImage
        in
        pkgs.appimageTools.wrapType2
          {
            name = "slippi-online";
            extraPkgs = pkgs: [
              pkgs.gmp
              pkgs.mpg123
              pkgs.libmpg123
            ];
            src = builtins.fetchurl {
              url = "https://github.com/${user}/${project}/releases/download/v${version}/${assetName}";
              sha256 = "${hash}";
            };
          }
      )
    ];

  xdg.configFile."SlippiOnline/Config/GCPadNew.ini".text = ''
    [GCPad1]
    Device = evdev/0/Xbox 360 Wireless Receiver
    Buttons/A = `Button 2`
    Buttons/B = `Button 3`
    Buttons/X = `Button 1`
    Buttons/Y = `Button 0`
    Buttons/Z = `Button 5`
    Buttons/Start = `Button 7`
    Main Stick/Up = `Axis 1-`
    Main Stick/Down = `Axis 1+`
    Main Stick/Left = `Axis 0-`
    Main Stick/Right = `Axis 0-+`
    Main Stick/Modifier/Range = 50.000000000000000
    C-Stick/Up = `Axis 4-`
    C-Stick/Down = `Axis 4+`
    C-Stick/Left = `Axis 3-`
    C-Stick/Right = `Axis 3-+`
    C-Stick/Modifier/Range = 50.000000000000000
    Triggers/L = `Axis 2-+`
    Triggers/R = `Axis 5+`
    D-Pad/Up = `Button 13`
    D-Pad/Down = `Button 14`
    D-Pad/Left = `Button 11`
    D-Pad/Right = `Button 12`
    Main Stick/Dead Zone = 50.000000000000000
    C-Stick/Dead Zone = 50.000000000000000
    [GCPad2]
    Main Stick/Dead Zone = 7.2296936792042858e+225
    C-Stick/Radius = 7.0634461777875856e-302
    Triggers/Threshold = 1.8526784551501365e-68
    [GCPad3]
    Buttons/Threshold = 6.9338065469619433e-308
    Main Stick/Radius = 3.7261370281373367e+235
    [GCPad4]
    Main Stick/Dead Zone = 6.3043380986191605e-30
    C-Stick/Radius = 7.0632744700283157e-302
    Triggers/Threshold = 1.0268840610555240e-310
    Microphone/Threshold = 9.6196565225512093e-35
    D-Pad/Threshold = 9.6196565225512093e-35
  '';

  xdg.configFile."SlippiOnline/Config/Dolphin.ini".text =
    let
      homeDir = "/home/will/";
      isoPath = "${homeDir}Games/ROMs/GC/";
      iso = "Super Smash Bros. Melee (USA) (En,Ja) (Rev 2).nkit.iso";
    in
    ''
      [General]
      ISOPaths = 1
      ISOPath0 = ${isoPath}
      LastFilename = ${isoPath}${iso}
      ShowLag = False
      ShowFrameCount = False
      RecursiveISOPaths = False
      NANDRootPath = 
      DumpPath = 
      WirelessMac = 
      WiiSDCardPath = 
      [Core]
      SlippiReplayDir = ${homeDir}Slippi
      SlippiReplayMonthFolders = False
      HLE_BS2 = False
      TimingVariance = 8
      CPUCore = 1
      Fastmem = True
      CPUThread = True
      DSPHLE = True
      SyncOnSkipIdle = True
      SyncGPU = False
      SyncGpuMaxDistance = 200000
      SyncGpuMinDistance = -200000
      SyncGpuOverclock = 1.00000000
      FPRF = False
      AccurateNaNs = False
      DefaultISO = 
      BootDefaultISO = False
      DVDRoot = 
      Apploader = 
      SelectedLanguage = 0
      OverrideGCLang = False
      DPL2Decoder = False
      TimeStretching = False
      RSHACK = False
      Latency = 0
      ReduceTimingDispersion = False
      SlippiOnlineDelay = 2
      SlippiEnableSpectator = True
      SlippiSpectatorLocalPort = 51441
      SlippiSaveReplays = False
      SlippiEnableQuickChat = 0
      SlippiForceNetplayPort = False
      SlippiNetplayPort = 2626
      SlippiForceLanIp = False
      SlippiLanIp = 
      SlippiPlaybackDisplayFrameIndex = False
      BlockingPipes = False
      MemcardAPath = ${homeDir}.config/SlippiOnline/GC/MemoryCardA.USA.raw
      MemcardBPath = ${homeDir}.config/SlippiOnline/GC/MemoryCardB.USA.raw
      AgpCartAPath = 
      AgpCartBPath = 
      SlotA = 255
      SerialPort1 = 255
      BBA_MAC = 
      SIDevice0 = 6
      AdapterRumble0 = True
      SimulateKonga0 = False
      SIDevice1 = 12
      AdapterRumble1 = True
      SimulateKonga1 = False
      SIDevice2 = 12
      AdapterRumble2 = True
      SimulateKonga2 = False
      SIDevice3 = 12
      AdapterRumble3 = True
      SimulateKonga3 = False
      WiiSDCard = False
      WiiKeyboard = False
      WiimoteContinuousScanning = False
      WiimoteEnableSpeaker = False
      RunCompareServer = False
      RunCompareClient = False
      EmulationSpeed = 1.00000000
      FrameSkip = 0x00000000
      Overclock = 1.00000000
      OverclockEnable = False
      GFXBackend = 
      GPUDeterminismMode = auto
      PerfMapDir = 
      EnableCustomRTC = False
      CustomRTCValue = 0x386d4380
      AllowAllNetplayVersions = False
      QoSEnabled = True
      AdapterWarning = True
      ShownLagReductionWarning = False
      [Interface]
      ConfirmStop = False
      UsePanicHandlers = True
      OnScreenDisplayMessages = True
      HideCursor = True
      AutoHideCursor = False
      MainWindowPosX = 1080
      MainWindowPosY = 0
      MainWindowWidth = 1920
      MainWindowHeight = 1080
      LanguageCode = 
      ShowToolbar = True
      ShowStatusbar = True
      ShowSeekbar = True
      ShowLogWindow = False
      ShowLogConfigWindow = False
      ExtendedFPSInfo = False
      ThemeName = Clean Blue
      PauseOnFocusLost = False
      DisableTooltips = False
      [Display]
      FullscreenResolution = Auto
      Fullscreen = True
      RenderToMain = False
      RenderWindowXPos = 1079
      RenderWindowYPos = 149
      RenderWindowWidth = 958
      RenderWindowHeight = 808
      RenderWindowAutoSize = False
      KeepWindowOnTop = False
      ProgressiveScan = False
      PAL60 = True
      DisableScreenSaver = True
      ForceNTSCJ = False
      [GameList]
      ListDrives = False
      ListWad = True
      ListElfDol = True
      ListWii = True
      ListGC = True
      ListJap = True
      ListPal = True
      ListUsa = True
      ListAustralia = True
      ListFrance = True
      ListGermany = True
      ListItaly = True
      ListKorea = True
      ListNetherlands = True
      ListRussia = True
      ListSpain = True
      ListTaiwan = True
      ListWorld = True
      ListUnknown = True
      ListSort = 3
      ListSortSecondary = 0
      ColorCompressed = True
      ColumnPlatform = True
      ColumnBanner = True
      ColumnNotes = True
      ColumnFileName = True
      ColumnID = True
      ColumnRegion = True
      ColumnSize = True
      ColumnState = False
      [Movie]
      PauseMovie = False
      Author = 
      DumpFrames = False
      DumpFramesSilent = False
      ShowInputDisplay = False
      ShowRTC = False
      [DSP]
      EnableJIT = True
      DumpAudio = False
      DumpAudioSilent = False
      DumpUCode = False
      Backend = ALSA
      Volume = 25
      CaptureLog = False
      [Input]
      BackgroundInput = False
      [FifoPlayer]
      LoopReplay = True
      [Analytics]
      ID = 37b3bfd002e905886f5b5fff4d91bec0
      Enabled = False
      PermissionAsked = True
      [Network]
      SSLDumpRead = False
      SSLDumpWrite = False
      SSLVerifyCert = False
      SSLDumpRootCA = False
      SSLDumpPeerCert = False
      [BluetoothPassthrough]
      Enabled = False
      VID = -1
      PID = -1
      LinkKeys = 
      [Sysconf]
      SensorBarPosition = 1
      SensorBarSensitivity = 50331648
      SpeakerVolume = 88
      WiimoteMotor = True
      WiiLanguage = 1
      AspectRatio = 1
      Screensaver = 0
    '';
}
