{ globals, ... }:

{
  virtualisation.docker = {
    enable = true;
    rootless = {
      enable = true;
      # The setSocketVariable option sets the DOCKER_HOST variable to the rootless Docker instance for normal users by default. 
      setSocketVariable = true;
    };
  };

  users.users.${globals.user}.extraGroups = [ "docker" ];
}
