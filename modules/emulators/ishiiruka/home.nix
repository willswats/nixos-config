{ pkgs, globals, ... }:


let

  duelSenseProfile = ''
    Buttons/A = `Button 0`
    Buttons/B = `Button 1`
    Buttons/X = `Button 3`
    Buttons/Y = `Button 2`
    Buttons/Z = `Button 5`
    Buttons/Start = `Button 9`
    Main Stick/Up = `Axis 1-`
    Main Stick/Down = `Axis 1+`
    Main Stick/Left = `Axis 0-`
    Main Stick/Right = `Axis 0+`
    Main Stick/Modifier = `Button 11`
    Main Stick/Modifier/Range = 50.000000000000000
    C-Stick/Up = `Axis 4-`
    C-Stick/Down = `Axis 4+`
    C-Stick/Left = `Axis 3-`
    C-Stick/Right = `Axis 3+`
    C-Stick/Modifier = `Button 12`
    C-Stick/Modifier/Range = 50.000000000000000
    Triggers/L = `Button 6`
    Triggers/R = `Button 7`
    D-Pad/Up = `Axis 7-`
    D-Pad/Down = `Axis 7+`
    D-Pad/Left = `Axis 6-`
    D-Pad/Right = `Axis 6+`
  '';
in
{
  home.packages = with pkgs; [
    (callPackage ../../../pkgs/ishiiruka { })
  ];

  home.file.".local/share/applications/ishiiruka.desktop".text = ''
    [Desktop Entry]
    Name=Slippi
    Exec=Ishiiruka
    Type=Application
    Icon=dolphin-emu
  '';

  # Setup settings (set path to ISO, disable slippi replays, set audio backend and volume)
  xdg.configFile."SlippiOnline/Config/Dolphin.ini" = {
    text =
      let
        homeDir = globals.directories.home;
        isoPath = "${globals.directories.drive}/Games/Emulation/ROMs/GC/";
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
        SlippiReplayDir = ${homeDir}/Slippi
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
        MemcardAPath = ${homeDir}/.config/SlippiOnline/GC/MemoryCardA.USA.raw
        MemcardBPath = ${homeDir}/.config/SlippiOnline/GC/MemoryCardB.USA.raw
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
        Backend = OpenAL
        Volume = 10
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
  };

  xdg.configFile."SlippiOnline/Config/Profiles/GCPad/DualSenseWired.ini" = {
    text = ''  
      [Profile]
      Device = evdev/0/Sony Interactive Entertainment DualSense Wireless Controller
      ${duelSenseProfile}
  '';
  };

  xdg.configFile."SlippiOnline/Config/Profiles/GCPad/DualSenseWireless.ini" = {
    text = ''
      [Profile]
      Device = evdev/0/DualSense Wireless Controller
      ${duelSenseProfile}
    '';
  };
}
