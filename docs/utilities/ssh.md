# SSH

## Generating SSH Key

Replace the email and run:

```bash
ssh-keygen -t ed25519 -C "your_email@example.com"
```

Press enter until you are prompted to set the passphrase, then set the
passphrase to something and save it somewhere.

## Adding SSH key to GitHub

Optionally navigate to [here] and delete any SSH keys that may have a conflicting name to the one that is going to be created.

Navigate to [here](https://github.com/settings/ssh/new) and input a title.

Run this command and input the output into the `Key` input on GitHub:

```bash
cat ~/.ssh/id_ed25519.pub
```

## Add the key

```bash
ssh-add ~/.ssh/id_ed25519
```

## Connect to GitHub

```bash
ssh git@github.com -v
```
