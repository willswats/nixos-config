{ ... }:

{
  services.mako = {
    enable = true;
    defaultTimeout = 5000; # Milliseconds
    borderSize = 2;
    backgroundColor = "#1e1e2e";
    textColor = "#cdd6f4";
    borderColor = "#89b4fa";
    progressColor = "over #313244";
    extraConfig = '' 
      [urgency=high]
      border-color=#fab387
    '';
  };
}
