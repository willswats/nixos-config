# TODO

## Bug Fix

- [ ] Dolphin Emulator (includes; Dolphin, Retroarch, Wii, GC) causes page fault after playing for a period of time (it occurs faster if fast forward is on, occurs on RADV `24.0.6`, `24.0.7`, AMDVLK `2023.Q4.2`, as well as kernels `6.6.31` and `6.9.1`) - [logs](./logs.txt)
  - Tried:
    - BIOS AMD Core Performance boost off
    - GNOME instead of Hyprland
  - Related:
    - [drm/amd/issues/31331](https://gitlab.freedesktop.org/drm/amd/-/issues/3131)
    - [drm/amd/issues/3067](https://gitlab.freedesktop.org/drm/amd/-/issues/3067)
    - [mesa/mesa/issues/10260](https://gitlab.freedesktop.org/mesa/mesa/-/issues/10260)
    - [drm/amd/issues/3176](https://gitlab.freedesktop.org/drm/amd/-/issues/3176)

## Other

- [ ] Format disk with [disko](https://github.com/nix-community/disko)
- [ ] Remove need for unlocking drive encryption - Yubikey or [secure boot and TPM 2.0](https://jnsgr.uk/2024/04/nixos-secure-boot-tpm-fde/)
