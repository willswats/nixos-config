# CS2

## Wayland

In `game/cs2.sh` change `export SDL_VIDEO_DRIVER=x11` to `export SDL_VIDEO_DRIVER=wayland`.

## Fix Lag Bomb

Add `LD_PRELOAD=""` to launch options.
