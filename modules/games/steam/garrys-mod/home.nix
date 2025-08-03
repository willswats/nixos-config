{ ... }:

{
  home.file.".steam/steam/steamapps/common/GarrysMod/garrysmod/cfg/autoexec.cfg".text = ''
    echo "autoexec.cfg executed"

    // -- UNBIND DEFAULTS --
    // Context menu
    unbind c

    // Voice chat
    unbind k 

    // Noclip
    unbind v 

    // Change weapons
    unbind mwheelup
    unbind mwheeldown

    // -- BINDS --

    # Switch mouse wheel between jump and change weapons
    alias mwheelinv "bind mwheelup invnext; bind mwheeldown invprev; bind / mwheeljump"
    alias mwheeljump "bind mwheelup +jump; bind mwheeldown +jump; bind / mwheelinv"
    bind / mwheeljump 
    mwheeljump

    alias lean "bind q +leanleft; bind e +leanright; bind . mousebuttonslook"
    alias rotate "bind q +left; bind e +right; bind . mousebuttonslean"
    bind . rotate
    rotate 

    bind mouse4 "impulse 100"

    bind f +use

    bind g +menu
    bind h +menu_context

    bind , +drop

    bind x noclip
    bind c lastinv
    bind v +voicerecord

    bindtoggle - voice_enable

    bind [ kill

    // -- SETTINGS --
    cl_yawspeed 230
    physgun_wheelspeed 50
    npc_citizen_auto_player_squad 0
    npc_citizen_auto_player_squad_allow_use 1
    vmanip_kick_bind mouse3

    host_writeconfig
  '';
}
