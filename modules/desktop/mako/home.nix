{ ... }:

{
  services.mako = {
    enable = true;
    defaultTimeout = 5000; # Milliseconds
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