{ ... }:

{
  services.ollama = {
    enable = true;
    # acceleration = "rocm";
    # Optional: load models on startup
    loadModels = [ "deepseek-r1:14b" ];
    # You can get the version for your GPU from the logs or like so: 
    # nix-shell -p "rocmPackages.rocminfo" --run "rocminfo" | grep "gfx"
    # environmentVariables = {
    #   HCC_AMDGPU_TARGET = "gfx1031";
    # };
    # rocmOverrideGfx = "10.3.1";
  };
}
