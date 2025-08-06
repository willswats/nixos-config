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

    alias mwheelinv "bind mwheelup invnext; bind mwheeldown invprev; bind / mwheeljump"
    alias mwheeljump "bind mwheelup +jump; bind mwheeldown +jump; bind / mwheelinv"
    bind / mwheeljump 
    mwheeljump

    alias mousebuttonslean "bind mouse4 +leanleft; bind mouse5 +leanright; bind . mousebuttonslook"
    alias mousebuttonslook "bind mouse4 +right; bind mouse5 +left; bind . mousebuttonslean"
    bind . mousebuttonslook 
    mousebuttonslook

    alias hidechat "hud_saytext_time 0; bind = showchat"
    alias showchat "hud_saytext_time 500; bind = hidechat"
    bind = showchat
    showchat

    bind , +drop

    bind q lastinv

    bind g +menu
    bind h +menu_context

    bind x noclip
    bind c "say !r"
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
