{ ... }:

{
  home.file.".steam/steam/steamapps/common/GarrysMod/garrysmod/cfg/autoexec.cfg".text = ''
    # Unbind defaults
    unbind k # voice chat   
    unbind v # noclip
    unbind alt # walk
    unbind mwheelup
    unbind mwheeldown

    # Binds
    bind mwheeldown +jump
    bind mwheelup +jump 
    bind mouse5 +left
    bind mouse4 +right

    bind x +walk
    bind v +voicerecord
    bind h "say !r"

    bind [ kill
    bind alt noclip

    # Other
    cl_yawspeed 230

    host_writeconfig
  '';
}