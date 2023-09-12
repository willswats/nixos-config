{ pkgs, ... }:

{
  home.packages = with pkgs; [
    (callPackage ../../../pkgs/osu-lazer-bin { })
  ];

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
              "x": 180.42426,
              "y": 101.48864
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
    '';
  };
}
