{ ... }:

{
  home.file.".steam/steam/steamapps/common/GarrysMod/garrysmod/cfg/autoexec.cfg".text = ''
    # Unbind defaults
    unbind k # voice chat   
    unbind v # noclip
    unbind alt # walk
    unbind b # zoom
    unbind mwheelup
    unbind mwheeldown

    alias mwheelinv "bind mwheelup invnext; bind mwheeldown invprev; bind / mwheeljump"
    alias mwheeljump "bind mwheelup +jump; bind mwheeldown +jump; bind / mwheelinv"
    bind / mwheeljump 
    mwheeljump
    bind mouse5 +left
    bind mouse4 +right

    bind x +walk
    bind v +voicerecord
    bind semicolon "say !r"
    bindtoggle - voice_enable

    bind [ kill
    bind alt noclip

    # Other
    cl_yawspeed 230
    physgun_wheelspeed 50

    host_writeconfig
  '';
}
