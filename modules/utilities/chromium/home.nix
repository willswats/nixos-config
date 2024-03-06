{ ... }:

{
  programs.chromium = {
    enable = true;
    extensions = [
      { id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; } # uBlock Origin
      { id = "eimadpbcbfnmbkopoojfekhnkhdbieeh"; } # Dark Reader
      { id = "mdjildafknihdffpkfmmpnpoiajfjnjd"; } # Consent-O-Matic
      { id = "dbepggeogbaibhgnhhndojpepiihcmeb"; } # Vimium
    ];
  };
}
