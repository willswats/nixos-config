{ ... }:

{
  boot.initrd.kernelModules = [ "amdgpu" ];
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    # AMDVLK currently causes issues with gamescope if it is installed https://github.com/ValveSoftware/gamescope/issues/991
    # The AMDVLK drivers can be used in addition to the Mesa RADV drivers. The program will choose which one to use:
    # extraPackages = with pkgs; [ amdvlk ];
    # extraPackages32 = with pkgs; [
    #   driversi686Linux.amdvlk
    # ];
  };

  # "RADV" or "AMDVLK"
  # Some games choose AMDVLK over RADV, which can cause noticeable performance issues (e.g. <50% less FPS in games)
  # To force RADV
  environment.variables.AMD_VULKAN_ICD = "RADV";
}
