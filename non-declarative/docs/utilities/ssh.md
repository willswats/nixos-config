# SSH

## Generating SSH Key

Run:

```bash
ssh-keygen -t ed25519 -C "willswats@users.noreply.github.com"
```

Press enter until you are prompted to set the passphrase, then set the
passphrase to something and save it somewhere.

## Adding SSH key to GitHub

Navigate to [here](https://github.com/settings/ssh/new) and input a title.

Ensure the key type is "Authentication Key".

Run this command and input the output into the `Key` input on GitHub:

```bash
cat ~/.ssh/id_ed25519.pub
```

Repeat the above steps, but set the key type to "Signing Key"

## Creating allowed_signers

Run:

```bash
cp ~/.ssh/id_ed25519.pub ~/.config/git/allowed_signers
```

Then edit `allowed_signers` and move the email to the start of the line.

## Add the key

```bash
ssh-add ~/.ssh/id_ed25519
```

## Connect to GitHub

```bash
ssh git@github.com -v
```
