# Filen

1. Create `syncPairs.json`

Desktop:

```bash
echo '[
  {
    "local": "/run/media/will/2TB/Drive/",
    "remote": "/",
    "syncMode": "twoWay",
    "excludeDotFiles": false
  }
]' > ~/.config/filen-cli/syncPairs.json
```

Laptop:

```bash
echo '
[
  {
    "local": "/home/will/Drive/",
    "remote": "/",
    "syncMode": "twoWay",
    "ignore": [
      "Dots/Games/",
      "Edits/",
      "Entertainment/",
      "Games/"
    ],
    "excludeDotFiles": false
  }
]' > ~/.config/filen-cli/syncPairs.json
```

2. Run `filen sync --continious`, sign in, then cancel the command.
3. Restart the `systemd` service if it has already failed:

```bash
systemctl --user restart filen-sync.service
```
