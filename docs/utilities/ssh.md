# SSH

## Generating SSH Key

Run:

```bash
ssh-keygen -t ed25519 -C "william@williamwatson.dev"
```

Press enter until you are prompted to set the passphrase, then set the
passphrase to something and save it somewhere.

## Add the key

```bash
ssh-add ~/.ssh/id_ed25519
```

## Adding SSH key to GitHub & Codeberg

Note: name the key in the following way for clarity: `{host-name}-{date}`, e.g. `will-desktop-2024-06-05`.

Navigate to [GitHub](https://github.com/settings/ssh/new).

Ensure the key type is "Authentication Key".

Run this command and input the output into the `Key` input on GitHub:

```bash
cat ~/.ssh/id_ed25519.pub
```

Repeat the above steps, but set the key type to "Signing Key"

Now do the same for [Codeberg](https://codeberg.org/user/settings/keys), and click verify, then follow the steps.

## Creating allowed_signers

Run:

```bash
cp ~/.ssh/id_ed25519.pub ~/.config/git/allowed_signers
```

Then edit `allowed_signers` and move the email to the start of the line.

## Add an SSH key to Gnome Keyring with Login Auto Unlock

1. Run `ssh-add -D` to remove all the keys from the SSH agent.
2. Run `git pull` on a repository that you've cloned with SSH.
3. When prompted to input your SSH key password, select "Automatically unlock this key whenever I'm logged in" (it may prompt twice).
