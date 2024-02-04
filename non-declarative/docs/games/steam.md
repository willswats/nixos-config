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
gamemoderun mangohud %command% -windowed -w 1920 -h 1080
```

Note: the `-windowed -w 1920 -h 1080` ensures that steam games do not attempt to resize there selves to the size of my second monitor (vertical), which commonly causes Wayland to crash.
