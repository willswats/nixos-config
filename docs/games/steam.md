# Steam

## Steam Settings

### Notifications

Play a sound when a notification toast is displayed: Disabled

When a friend joins a game: Disabled

### Interface

Start Up Location: Library

Enable context menu focus compatibility mode: Enabled

Notify me about additions or changes to my games, new releases and upcoming releases: Disabled

Enable GPU accelerated rendering in web views: Disabled

## Big Picture

### Display

Start Big Picture mode Windowed: Enabled

## Launch Options

### gamescope

Use these launch options on games that work better with gamescope:

```text
gamemoderun gamescope -w 1920 -h 1080 -r 144 -f --force-grab-cursor --expose-wayland -- env LD_PRELOAD="$LD_PRELOAD" %command%
```

`LD_PRELOAD` is needed to fix the issue described on the [arch wiki here](<https://wiki.archlinux.org/title/Gamescope#Launching_gamescope_from_Steam,_stuttering_after*~24*minutes*(Gamescope_Lag_Bomb)>).

### Without gamescope

Use these launch options on games that work better without gamescope:

```text
gamemoderun %command%
```
