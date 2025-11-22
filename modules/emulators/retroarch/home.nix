{ pkgs, ... }:

{
  home.packages =
    let
      # https://github.com/NixOS/nixpkgs/tree/master/pkgs/applications/emulators/libretro
      retroarchWithCores = (
        pkgs.retroarch.withCores (
          cores: with cores; [
            mgba # Nintendo - Game Boy Advance (mGBA)
            mesen # Nintendo - NES / Famicom (Mesen)
            mupen64plus # Nintendo - Nintendo 64 (Mupen64Plus-Next)
            bsnes # - Nintendo - SNES / SFC (bsnes)
            blastem # Sega - Mega Drive - Genesis (BlastEm)
            beetle-saturn # Sega - Saturn (Beetle Saturn)
            flycast # Sega - Dreamcast/Naomi (Flycast)
            beetle-psx # Sony - Playstation (Beetle PSX)
            ppsspp # Sony - PlayStation Portable (PPSSPP)
            desmume # Nintendo - DS (DeSmuME)
            citra # Nintendo - 3DS (Citra)
            fbneo # Arcade (FinalBurn Neo)
          ]
        )
      );
    in
    [
      retroarchWithCores
    ];
}
