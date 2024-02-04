# Steam

## Steam Settings

### Notifications

Play a sound when a notification toast is displayed: Disabled

When a friend joins a game: Disabled

### Interface

Start Up Location: Library

Enable context menu focus compatibility mode: Enabled

### Compatability

Enable Steam Play for all other titles: Enabled

## Launch Options

Use these launch options on every game:

```text
gamemoderun mangohud %command% -fullscreen -w 1920 -h 1080 -novid
```

Note: the `-windowed -w 1920 -h 1080` ensures that steam games do not attempt to resize there selves to the size of my second monitor (vertical), which commonly causes Wayland to crash.

### Source Games

TF2, Counter-Strike: Source, and other Source games are currently broken on Linux, and the `LD_PRELOAD` launch option fixes it:

```text
gamemoderun mangohud LD_PRELOAD=$LD_PRELOAD:/run/current-system/sw/lib/libtcmalloc_minimal.so %command% -fullscreen -w 1920 -h 1080 -novid
```
