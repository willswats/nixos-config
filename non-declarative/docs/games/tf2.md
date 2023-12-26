# TF2

## HUD

```bash
git clone https://github.com/rbjaxter/budhud.git ~/.steam/steam/steamapps/common/'Team Fortress 2'/tf/custom/budhud-master
```

## Launch Options

TF2 is currently broken on Linux, and the `LD_PRELOAD` launch option fixes it.

```text
LD_PRELOAD=$LD_PRELOAD:/run/current-system/sw/lib/libtcmalloc_minimal.so %command% -novid
```
