{ pkgs, ... }:

{
  boot.initrd.kernelModules = [ "amdgpu" ];
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [ amdvlk ];
    extraPackages32 = with pkgs; [
      driversi686Linux.amdvlk
    ];
  };

  # "RADV" or "AMDVLK"
  # Default is AMDVLK if installed
  environment.variables.AMD_VULKAN_ICD = "AMDVLK";
}
