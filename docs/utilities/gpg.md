# GPG

<!--toc:start-->

- [Generating a GPG Key](#generating-a-gpg-key)
- [Adding the GPG Key to a GitHub](#adding-the-gpg-key-to-a-github)
  - [Obtaining the GPG Secret Key ID](#obtaining-the-gpg-secret-key-id)
  - [Exporting and Adding the Key to GitHub](#exporting-and-adding-the-key-to-github)
- [GPG SSH Authentication](#gpg-ssh-authentication)
  - [Add the Keygrip](#add-the-keygrip)
  - [Adding the SSH Key to GitHub](#adding-the-ssh-key-to-github)
  - [Connecting to GitHub](#connecting-to-github)
- [Revoking a GPG key](#revoking-a-gpg-key)
  - [Obtaining the GPG Public Key ID](#obtaining-the-gpg-public-key-id)
  - [Generate `revoke.asc`](#generate-revokeasc)
  - [Import `revoke.asc`](#import-revokeasc)
  - [Export the Revoked Key](#export-the-revoked-key)
  - [Adding the Revoked Key to GitHub](#adding-the-revoked-key-to-github)
- [Add an SSH key to Gnome Keyring with Login Auto Unlock](#add-an-ssh-key-to-gnome-keyring-with-login-auto-unlock)
<!--toc:end-->

## Generating a GPG Key

Run:

```bash
gpg --full-generate-key
```

1. Accept all the defaults.
2. Input your name and email address.
3. Set the passphrase and save it somewhere.

## Adding the GPG Key to a GitHub

### Obtaining the GPG Secret Key ID

Run this command to obtain the long form of the GPG key ID:

```bash
gpg --list-secret-keys --keyid-format=long
```

The secret key can be found next to `sec` after the `/`.

### Exporting and Adding the Key to GitHub

Run the following command with the GPG secret key ID:

```bash
gpg --armor --export
```

Copy all of the output and add it to [GitHub](https://github.com/settings/gpg/new).

Name the key in the following way for clarity: `{host-name}-{date}`, e.g. `will-desktop-2024-06-05`.

## GPG SSH Authentication

### Add the Keygrip

Run the following command with the GPG key real name (e.g. William Watson) appended:

```bash
gpg --with-keygrip -k
```

Add the public keygrip to `~/.gnupg/sshcontrol`.

### Adding the SSH Key to GitHub

Run this command:

```bash
ssh-add -L
```

Copy all of the output and add it to [GitHub](https://github.com/settings/ssh/new).

Name the key in the following way for clarity: `{host-name}-{date}`, e.g. `will-desktop-2024-06-05`.

Select "Key type" as "Authentication Key".

### Connecting to GitHub

Run this to ensure that you can connect to GitHub (this will add it to `~/.ssh/known_hosts` as well):

```bash
ssh git@github.com -v
```

## Revoking a GPG key

### Obtaining the GPG Public Key ID

The public key ID can be found next to `pub` after the `/`.

```bash
gpg --list-keys
```

### Generate `revoke.asc`

Replace `KEY-ID` with your GPG public key ID:

```bash
gpg --output revoke.asc --gen-revoke KEY-ID
```

Select the reason, but note that selecting `Key has been compromised` will likely result in the commits becoming unverified on GitHub.

### Import `revoke.asc`

This will revoke the key specified by the key ID:

```bash
gpg --import revoke.asc
```

### Export the Revoked Key

Replace `KEY-ID` with your GPG public key ID:

```bash
gpg --output public.pgp --armor --export KEY-ID
```

### Adding the Revoked Key to GitHub

Open `public.gpg` in a text editor and add the contents to [GitHub](https://github.com/settings/gpg/new).

Name the key in the following way for clarity on GitHub: `{host-name}-revoked-{date}`, e.g. `will-desktop-revoked-2024-06-05`.

You can now delete the old GPG key on GitHub, as well as the local GPG key and SSH key (with seahorse).

### Saving the Revoked Key

You may need the revoked key to ensure that git commits are verified on another git hosting site, therefore, save the `public.gpg` key somewhere under the format: `{host-name}-revoked-{date}`.

## Add an SSH key to Gnome Keyring with Login Auto Unlock

1. Run `git pull` on a repository that you've cloned with SSH.
2. When prompted to input your SSH key, select "Save in password manager".
