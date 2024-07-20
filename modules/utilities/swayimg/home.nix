{ pkgs, globals, ... }:

{
  home.packages = with pkgs; [
    swayimg
  ];


  xdg.mimeApps = {
    defaultApplications = {
      "image/png" = [ "swayimg.desktop" ]; # jpg
      "image/jpeg" = [ "swayimg.desktop" ]; # png
      "image/heif" = [ "swayimg.desktop" ]; # HEIC
      "image/webp" = [ "swayimg.desktop" ]; # webp
      "image/gif" = [ "swayimg.desktop" ]; # gif
      "image/svg+xml" = [ "swayimg.desktop" ]; # svg
    };
  };

  # https://github.com/artemsen/swayimg/blob/master/extra/swayimgrc
  xdg.configFile."swayimg/config" =
    let
      base = "#${globals.colours.base}";

      font = globals.font.name;
    in
    {
      text = ''
        ################################################################################
        # General options
        ################################################################################
        [general]

        # Initial scale (optimal/fit/width/height/fill/real)
        scale = optimal

        # Start in full screen mode (yes/no)
        fullscreen = no

        # Anti-aliasing (yes/no)
        antialiasing = yes

        # Background for transparent images (none/grid/RGB, e.g. #112233)
        transparency = grid

        # Window position (parent or absolute coordinates, e.g. 100,200)
        position = parent
        # Window size (parent, image, or absolute size, e.g. 800,600)
        size = parent
        # Window background mode/color (none/RGB, e.g. #112233)
        background = ${base}

        # Run slideshow at startup (yes/no)
        slideshow = no
        # Slideshow image display time (seconds)
        slideshow_time = 3

        ################################################################################
        # Image list configuration
        ################################################################################
        [list]
        # Default order (none/alpha/random)
        order = alpha
        # Looping list of images (yes/no)
        loop = no
        # Read directories recursively (yes/no)
        recursive = no
        # Open all files in the start directory (yes/no)
        all = yes

        ################################################################################
        # Font configuration
        ################################################################################
        [font]
        # Font name
        name = ${font}
        # Font size (in pt)
        size = 14
        # Font color
        color = #cccccc
        # Drop shadow (none/RGB, e.g. #112233)
        shadow = #000000

        ################################################################################
        # Image meta info scheme (format, size, EXIF, etc)
        ################################################################################
        [info]
        # Mode on startup (off/brief/full)
        mode = brief
        # Display scheme for the "full" mode: position = content
        full.topleft = scale,frame
        full.topright = index
        full.bottomleft = name,format,filesize,imagesize,exif 
        full.bottomright = status
        # Display scheme for the "brief" mode: position = content
        brief.topleft = scale,frame
        brief.topright = index
        brief.bottomleft = none
        brief.bottomright = none

        ################################################################################
        # Key binding section: key = action [parameters]
        # Key can be specified with modifiers, e.g "Ctrl+Alt+Shift+x"
        # Use the `xkbcli` tool to get key name: `xkbcli interactive-wayland`
        ################################################################################
        [keys]
        F1 = help
        Home = first_file
        End = last_file
        Prior = prev_file
        Next = next_file
        Space = next_file
        Shift+d = prev_dir
        d = next_dir
        Shift+o = prev_frame
        o = next_frame
        Shift+s = slideshow
        s = animation
        f = fullscreen
        Left = step_left 10
        Right = step_right 10
        Up = step_up 10
        Down = step_down 10
        Equal = zoom +10
        Plus = zoom +10
        Minus = zoom -10
        w = zoom width
        Shift+w = zoom height
        z = zoom fit
        Shift+z = zoom fill
        0 = zoom real
        BackSpace = zoom optimal
        bracketleft = rotate_left
        bracketright = rotate_right
        m = flip_vertical
        Shift+m = flip_horizontal
        a = antialiasing
        r = reload
        i = info
        e = exec echo "Image: %"
        Escape = exit
        q = exit

        n = next_file   
        p = prev_file 
        h = step_left 10
        l = step_right 10
        k = step_up 10
        j = step_down 10

        ################################################################################
        # Mouse / touchpad configuration, same format as in [keys]
        ################################################################################
        [mouse]
        ScrollLeft = step_right 5
        ScrollRight = step_left 5
        ScrollUp = step_down 5
        ScrollDown = step_up 5
        Ctrl+ScrollUp = zoom +10
        Ctrl+ScrollDown = zoom -10
        Shift+ScrollUp = prev_file
        Shift+ScrollDown = next_file
        Alt+ScrollUp = prev_frame
        Alt+ScrollDown = next_frame
      '';
    };
}
