# rescrobbled

1. Run `rescrobbled` to generate `~/.config/rescrobbled/config.toml`.
2. If not already obtained, obtain a last.fm API key and secret from [here](https://www.last.fm/api/account/create).
3. Uncomment and insert the last.fm API key and secret.
4. Obtain the listenbrainz token from [here](https://listenbrainz.org/settings/)
5. Uncomment `[[listenbrainz]]` and `token`, then insert the listenbrainz token.
6. Uncomment and change `player-whitelist` to `player-whitelist = ["termusic", "YoutubeMusic"]`.
7. Run `rescrobbled` and sign into last.fm with username and password.
