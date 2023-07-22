{ ... }:

{
  home.file.".rustup/settings.toml".text = ''
    default_toolchain = "stable-x86_64-unknown-linux-gnu"
    profile = "default"
    version = "12"
  '';
}
