{ ... }:

{
  home.file.".steam/steam/steamapps/common/GarrysMod/garrysmod/cfg/autoexec.cfg".text = ''
    # -- UNBIND DEFAULTS --
    # Context menu
    unbind c

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

    alias mousebuttonslean "bind mouse4 +leanleft; bind mouse5 +leanright; bind . mousebuttonslook"
    alias mousebuttonslook "bind mouse4 +right; bind mouse5 +left; bind . mousebuttonslean"
    bind . mousebuttonslook 
    mousebuttonslook

    bind , +drop

    bind mouse4 +right
    bind mouse5 +left

    bind c "say !r"
    bind v +voicerecord
    bind g +menu_context
    bindtoggle - voice_enable

    bind [ kill
    bind x noclip

    # -- SETTINGS --
    cl_yawspeed 230
    physgun_wheelspeed 50
    npc_citizen_auto_player_squad 0
    npc_citizen_auto_player_squad_allow_use 1
    vmanip_kick_bind mouse3

    host_writeconfig
  '';
}
