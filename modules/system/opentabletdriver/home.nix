{ ... }:

{
  xdg.configFile."OpenTabletDriver/settings.json" = {
    text = ''
      {
        "Profiles": [
          {
            "Tablet": "Huion HS610",
            "OutputMode": {
              "Path": "OpenTabletDriver.Desktop.Output.AbsoluteMode",
              "Settings": [],
              "Enable": true
            },
            "Filters": [],
            "AbsoluteModeSettings": {
              "Display": {
                "Width": 1920.0,
                "Height": 1080.0,
                "X": 2040.0,
                "Y": 540.0,
                "Rotation": 0.0
              },
              "Tablet": {
                "Width": 180.42426,
                "Height": 101.48864,
                "X": 127.0,
                "Y": 79.375,
                "Rotation": 0.0
              },
              "EnableClipping": true,
              "EnableAreaLimiting": false,
              "LockAspectRatio": false
            },
            "RelativeModeSettings": {
              "XSensitivity": 10.0,
              "YSensitivity": 10.0,
              "RelativeRotation": 0.0,
              "RelativeResetDelay": "00:00:00.1000000"
            },
            "Bindings": {
              "TipActivationThreshold": 0.0,
              "TipButton": {
                "Path": "OpenTabletDriver.Desktop.Binding.MouseBinding",
                "Settings": [
                  {
                    "Property": "Button",
                    "Value": "Left"
                  }
                ],
                "Enable": true
              },
              "EraserActivationThreshold": 0.0,
              "EraserButton": null,
              "PenButtons": [
                {
                  "Path": "OpenTabletDriver.Desktop.Binding.MouseBinding",
                  "Settings": [
                    {
                      "Property": "Button",
                      "Value": "Left"
                    }
                  ],
                  "Enable": true
                },
                {
                  "Path": "OpenTabletDriver.Desktop.Binding.MouseBinding",
                  "Settings": [
                    {
                      "Property": "Button",
                      "Value": "Right"
                    }
                  ],
                  "Enable": true
                }
              ],
              "AuxButtons": [
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null
              ],
              "MouseButtons": [],
              "MouseScrollUp": null,
              "MouseScrollDown": null
            }
          }
        ],
        "LockUsableAreaDisplay": true,
        "LockUsableAreaTablet": true,
        "Tools": []
      }
    '';
  };
}
