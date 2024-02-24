# Steam

## Steam Settings

### Notifications

Play a sound when a notification toast is displayed: Disabled

When a friend joins a game: Disabled

### Interface

Start Up Location: Library

Enable context menu focus compatibility mode: Enabled

### In Game

In-game FPS counter: Top-right

### Compatability

Enable Steam Play for all other titles: Enabled

## Launch Options

### Non-gamescope

Use these launch options on games that work better without gamescope:

```text
gamemoderun mangohud %command% -fullscreen -w 1920 -h 1080 -novid
```

Note: the `-windowed -w 1920 -h 1080` ensures that steam games do not attempt to resize there selves to the size of my second monitor (vertical), which commonly causes Wayland to crash.

### gamescope

Use these launch options on games that work better with gamescope:

```text
gamemoderun gamescope -w 1920 -h 1080 -r 288 -f -e -- mangohud %command% -novid
```

Note: `-r 288` is set as otherwise the fps is capped to my monitors refresh rate.

### Source Games

TF2, Counter-Strike: Source, and other Source games are currently broken on Linux, and the `LD_PRELOAD` launch option fixes it:

```text
gamemoderun mangohud LD_PRELOAD=$LD_PRELOAD:/run/current-system/sw/lib/libtcmalloc_minimal.so %command% -fullscreen -w 1920 -h 1080 -novid
```
