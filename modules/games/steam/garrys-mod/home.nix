{ ... }:

{
  home.file.".steam/steam/steamapps/common/GarrysMod/garrysmod/cfg/autoexec.cfg".text = ''
    # -- UNBIND DEFAULTS --

    # Voice chat
    unbind k 

    # Noclip
    unbind v 

    # Change weapons
    unbind mwheelup
    unbind mwheeldown

    # -- BINDS --

    # Switch mouse wheel between jump and change weapons
    alias mwheelinv "bind mwheelup invnext; bind mwheeldown invprev; bind / mwheeljump"
    alias mwheeljump "bind mwheelup +jump; bind mwheeldown +jump; bind / mwheelinv"
    bind / mwheeljump 
    mwheeljump

    bind mouse5 +left
    bind mouse4 +right

    bind v +voicerecord
    bind semicolon "say !r"
    bindtoggle - voice_enable

    bind [ kill
    bind x noclip

    # -- SETTINGS --
    cl_yawspeed 230
    physgun_wheelspeed 50

    host_writeconfig
  '';
}
