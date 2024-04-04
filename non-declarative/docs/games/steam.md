# Steam

## Steam Settings

### Notifications

When a friend joins a game: Disabled

### Interface

Start Up Location: Library

Enable context menu focus compatibility mode: Enabled

### In Game

In-game FPS counter: Top-right

### Compatability

Enable Steam Play for all other titles: Enabled

## Launch Options

### Source Games

TF2, Counter-Strike: Source, and other Source games are currently broken on Linux, and the `LD_PRELOAD` launch option fixes it:

```text
LD_PRELOAD=$LD_PRELOAD:/run/current-system/sw/lib/libtcmalloc_minimal.so %command% -novid
```
