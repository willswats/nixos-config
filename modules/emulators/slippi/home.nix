{ host, ... }:

let
  duelSenseProfile = ''
    Buttons/A = `Button 3`
    Buttons/B = `Button 2`
    Buttons/X = `Button 0`
    Buttons/Y = `Button 1`
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
  slippi-launcher =
    let
      isoPath = "${host.directories.drive}/Games/Emulation/ROMs/GC/Super Smash Bros. Melee (USA) (En,Ja) (Rev 2).nkit.iso";
    in
    {
      enable = true;
      launchMeleeOnPlay = true; # Switch to false to change dolphin settings
      isoPath = isoPath;
      rootSlpPath = ""; # The folder where your SLP replays should be saved
      spectateSlpPath = ""; # The folder where spectated games should be saved
    };

  # Setup controller profiles
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
