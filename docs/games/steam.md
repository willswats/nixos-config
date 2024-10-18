# Steam

## Steam Settings

### Notifications

Play a sound when a notification toast is displayed: Disabled

When a friend joins a game: Disabled

### Interface

Start Up Location: Library

Enable context menu focus compatibility mode: Enabled

Notify me about additions or changes to my games, new releases and upcoming releases: Disabled

### In Game

In-game FPS counter: Top-right

### Compatability

Enable Steam Play for all other titles: Enabled

## Launch Options

### Source Games

Counter-Strike: Source, and a few other Source games are currently broken on Linux, and the `LD_PRELOAD` launch option fixes it:

```text
LD_PRELOAD=$LD_PRELOAD:/run/current-system/sw/lib/libtcmalloc_minimal.so %command% -novid
```
