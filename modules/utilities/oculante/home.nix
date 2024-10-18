{ pkgs, ... }:

{
  home.packages = with pkgs; [
    oculante
  ];

  # Fix failed to open file in PCManFM - https://github.com/woelper/oculante/issues/399
  # https://github.com/woelper/oculante/blob/0ff5d53bd0592538ea73387553cddbfebc6777cc/res/oculante.desktop
  home.file.".local/share/applications/oculante.desktop".text = ''
    [Desktop Entry]
    Name=Oculante
    Comment=A no-nonsense hardware-accelerated image viewer
    GenericName=Image Viewer
    Keywords=image viewer;graphics;
    Exec=oculante %F
    Icon=oculante
    Terminal=false
    Categories=Graphics;
    Type=Application
    MimeType=image/bmp;image/gif;image/vnd.microsoft.icon;image/jpeg;image/png;image/pnm;image/avif;image/tiff;image/webp;image/svg+xml;image/exr;image/x-dcraw;image/x-nikon-nef;image/x-canon-cr2;image/x-adobe-dng;image/x-epson-erf;image/x-fuji-raf;image/x-sony-arw;image/x-sony-srf;image/x-sony-sr2;image/x-panasonic-raw;
  '';

  xdg.mimeApps = {
    defaultApplications = {
      "image/png" = [ "oculante.desktop" ]; # jpg
      "image/jxl" = [ "oculante.desktop" ]; # jxl
      "image/jpeg" = [ "oculante.desktop" ]; # png
      "image/heif" = [ "oculante.desktop" ]; # HEIC
      "image/webp" = [ "oculante.desktop" ]; # webp
      "image/avif" = [ "oculante.desktop" ]; # avif
      "image/svg" = [ "oculante.desktop" ]; # svg
      "image/gif" = [ "oculante.desktop" ]; # gif
    };
  };

  xdg.configFile."oculante/config.json" = {
    text = ''
      {
        "accent_color": [
          137,
          180,
          250
        ],
        "background_color": [
          30,
          30,
          46
        ],
        "vsync": true,
        "force_redraw": false,
        "shortcuts": {
          "AlwaysOnTop": [
            "T"
          ],
          "Fullscreen": [
            "F"
          ],
          "InfoMode": [
            "I"
          ],
          "EditMode": [
            "E"
          ],
          "NextImage": [
            "N"
          ],
          "FirstImage": [
            "Home"
          ],
          "LastImage": [
            "End"
          ],
          "PreviousImage": [
            "P"
          ],
          "RedChannel": [
            "R"
          ],
          "GreenChannel": [
            "G"
          ],
          "BlueChannel": [
            "B"
          ],
          "AlphaChannel": [
            "A"
          ],
          "RGBChannel": [
            "U"
          ],
          "RGBAChannel": [
            "C"
          ],
          "ResetView": [
            "V"
          ],
          "ZoomOut": [
            "Minus"
          ],
          "ZoomIn": [
            "Equals"
          ],
          "ZoomActualSize": [
            "Key1"
          ],
          "ZoomDouble": [
            "Key2"
          ],
          "ZoomThree": [
            "Key3"
          ],
          "ZoomFour": [
            "Key4"
          ],
          "ZoomFive": [
            "Key5"
          ],
          "CompareNext": [
            "C",
            "LShift"
          ],
          "PanLeft": [
            "L"
          ],
          "PanRight": [
            "H"
          ],
          "PanUp": [
            "J"
          ],
          "PanDown": [
            "K"
          ],
          "DeleteFile": [
            "Delete"
          ],
          "LosslessRotateRight": [
            "RBracket"
          ],
          "LosslessRotateLeft": [
            "LBracket"
          ],
          "Copy": [
            "C",
            "LControl"
          ],
          "Paste": [
            "LControl",
            "V"
          ],
          "Browse": [
            "LControl",
            "O"
          ],
          "Quit": [
            "Q"
          ],
          "ZenMode": [
            "Z"
          ]
        },
        "keep_view": false,
        "max_cache": 30,
        "show_scrub_bar": true,
        "wrap_folder": false,
        "keep_edits": false,
        "favourite_images": [],
        "recent_images": [],
        "title_format": "{APP} | {FILENAME}",
        "info_enabled": false,
        "edit_enabled": false,
        "window_geometry": [
          [
            1920,
            0
          ],
          [
            1920,
            1080
          ]
        ],
        "last_open_directory": "",
        "show_checker_background": false,
        "show_minimap": false,
        "show_frame": false,
        "current_channel": "Rgba",
        "svg_scale": 1.0,
        "zen_mode": false,
        "theme": "Dark",
        "linear_mag_filter": false,
        "fit_image_on_window_resize": true,
        "zoom_multiplier": 1.0,
        "borderless": false
      }
    '';
  };
}
