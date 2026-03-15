# Rclone

1. Run `rclone config` and configure Filen (run `filen export-api-key` to get the API key).
2. Create filters file:

Laptop:

```fish
echo "\
- .filen.trash.local/
- /Dots/Games/
- /Edits/
- /Entertainment/
- /Games/" > /home/will/.config/rclone/bisync-filters.txt
```

Desktop:

```fish
echo "- .filen.trash.local/" > /home/will/.config/rclone/bisync-filters.txt
```

3. Run the following command and replace `localDrive` with the local drive location (make local match remote):

```bash
rclone bisync filen: localDrive \
  --create-empty-src-dirs \
  --resilient \
  --resync \
  --log-level INFO \
  --log-file "/home/will/.config/rclone/rclone.log" \
  --filters-file "/home/will/.config/rclone/bisync-filters.txt"
```

Flags explained:

- `--create-empty-src-dirs` - Sync creation and deletion of empty directories
- `--compare size,modtime,checksum` Compare files based on all three
- `--slow-hash-sync-only` - Only check checksums where `modtime` and `size` has changed
- `--resilient` - Allow future runs to retry after certain less-serious errors, instead of requiring `--resync`.
- `--resync` - Must be used on first run of `bisync`
