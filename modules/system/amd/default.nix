{ ... }:

{
  boot.initrd.kernelModules = [ "amdgpu" ];
  hardware.opengl = {
    enable = true;
    # Vulkan
    driSupport = true;
    driSupport32Bit = true;
  };
}
