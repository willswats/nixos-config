{ pkgs, ... }:

{
  home.packages = with pkgs;
    [
      (retroarch.override {
        cores = with libretro; [
          # https://github.com/NixOS/nixpkgs/blob/master/pkgs/applications/emulators/retroarch/cores.nix
          mgba # Nintendo - Game Boy Advance (mGBA)
          dolphin # Nintendo - GameCube / Wii (Dolphin)
          mesen # Nintendo - NES / Famicom (Mesen)
          mupen64plus # Nintendo - Nintendo 64 (Mupen64Plus-Next)
          bsnes # - Nintendo - SNES / SFC (bsnes)
          blastem # Sega - Mega Drive - Genesis (BlastEm)
          swanstation # Sony - Playstation (SwanStation)
          desmume # Nintendo - DS (DeSmuME)
          # citra # Nintendo - 3DS (Citra)
        ];
      })
    ];
}
