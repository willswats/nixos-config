# GPG

## Generating a GPG Key

Run:

```bash
gpg --full-generate-key
```

1. Accept the defaults until prompted to set how long the key should be valid, then input `2y` for two years.
2. Once prompted to enter your user ID information, input your full name and your GitHub email address.
3. Once prompted to set a passphrase, set it and save it somewhere.

## Adding the GPG Key to GitHub

### Obtaining the GPG Key ID

Run this command to obtain the long form of the GPG key ID:

```bash
gpg --list-secret-keys --keyid-format=long
```

The key can be found next to `sec` after the `/`.

### Exporting and Adding the Key to GitHub

Run the following command with the GPG key ID you'd like to use:

```bash
gpg --armor --export
```

Copy all of the output and add it to GitHub [here](https://github.com/settings/gpg/new).

## GPG SSH Authentication

### Add the Keygrip

Run the following command with the GPG key real name appended:

```bash
gpg --with-keygrip -k
```

Add the keygrip to `~/.gnupg/sshcontrol`.

### Adding the SSH Key to GitHub

Run this command:

```bash
ssh-add -L
```

Copy all of the output and add it to GitHub [here](https://github.com/settings/ssh/new).

### Connecting to GitHub

Run this to ensure that you can connect to GitHub (this will add it to `~/.ssh/known_hosts` as well):

```bash
ssh git@github.com -v
```
