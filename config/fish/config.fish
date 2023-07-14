# Remove fish greeting
set -g fish_greeting

# Set alias
alias docker="podman"
alias flatdel="flatpak uninstall --delete-data"
alias github="ssh-add ~/.ssh/id_ed25519"

# nvim to directories
alias note="cd Drive/Work/Notebook; nvim"
alias code="cd ~/Code; nvim"

# set PATH
set PATH $HOME/.local/bin $PATH
set PATH $HOME/.cargo/bin $PATH
set PATH $HOME/.local/share/pnpm $PATH

# Set theme
fish_config theme choose "Catppuccin Mocha"
