{ pkgs, ... }:

{
  home.packages =
    [
      (
        let
          user = "ppy";
          project = "osu";
          assetName = "osu.AppImage";
          version = "2023.803.0"; # Pin the version as each new version will return a different hash
          hash = "01gjrjakd08kg5g08pkn451q6yw8dgsh0kapb41i31q42bp67vvw"; # nix-prefetch-url https://github.com/ppy/osu/releases/download/2023.803.0/osu.AppImage
        in
        pkgs.appimageTools.wrapType2
          {
            name = "osu!";
            extraPkgs = pkgs: with pkgs; [ icu ];
            src = builtins.fetchurl {
              url = "https://github.com/${user}/${project}/releases/download/${version}/${assetName}";
              sha256 = hash;
            };
          }
      )
    ];

  # Create desktop entry
  home.file.".local/share/icons/lazer.png".source = ./lazer.png;
  home.file.".local/share/applications/osu.desktop".text = ''
    [Desktop Entry]
    Name=osu!
    Exec=osu!
    Type=Application
    Icon=lazer
  '';

  # Setup tablet
  home.file.".local/share/osu/input.json" = {
    force = true;
    text = ''
        {
          "InputHandlers": [
            {
              "$type": "osu.Framework.Input.Handlers.Keyboard.KeyboardHandler, osu.Framework",
              "Description": "Keyboard",
              "IsActive": true,
              "Enabled": true
            },
            {
              "$type": "osu.Framework.Input.Handlers.Tablet.OpenTabletDriverHandler, osu.Framework",
              "Description": "Tablet",
              "IsActive": true,
              "AreaOffset": {
                "x": 127.0,
                "y": 79.375
              },
              "AreaSize": {
                "x": 160.26843,
                "y": 90.15099
              },
              "Rotation": 0.0,
              "Tablet": {
                "Name": "Huion HS610",
                "Size": {
                  "x": 254.0,
                  "y": 158.75
                }
              },
              "Enabled": true
            },
            {
              "$type": "osu.Framework.Input.Handlers.Mouse.MouseHandler, osu.Framework",
              "UseRelativeMode": false,
              "Sensitivity": 1.0,
              "Description": "Mouse",
              "IsActive": true,
              "Enabled": true
            },
            {
              "$type": "osu.Framework.Input.Handlers.Touch.TouchHandler, osu.Framework",
              "IsActive": true,
              "Description": "Touch",
              "Enabled": true
            },
            {
              "$type": "osu.Framework.Input.Handlers.Joystick.JoystickHandler, osu.Framework",
              "DeadzoneThreshold": 0.099999994,
              "Description": "Joystick / Gamepad",
              "IsActive": true,
              "Enabled": true
            },
            {
              "$type": "osu.Framework.Input.Handlers.Midi.MidiHandler, osu.Framework",
              "Description": "MIDI",
              "IsActive": true,
              "Enabled": true
            }
          ]
        }
      }
    '';
  };
}
