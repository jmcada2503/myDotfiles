#!/bin/bash

ln -s ~/.dotfiles/nvim ~/
ln -s ~/.dotfiles/zsh/macos/.zshrc ~/.zshrc
ln -s ~/.dotfiles/tmux/.tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/aerospace/aerospace.toml ~/.config/aerospace/aerospace.toml

# Claude Code
mkdir -p ~/.claude ~/.claude/hooks
ln -sf ~/.dotfiles/claude/settings.json ~/.claude/settings.json
ln -sf ~/.dotfiles/claude/CLAUDE.md ~/.claude/CLAUDE.md
ln -sf ~/.dotfiles/claude/hooks/notify.sh ~/.claude/hooks/notify.sh
ln -sf ~/.dotfiles/claude/hooks/stash_command.sh ~/.claude/hooks/stash_command.sh
ln -sf ~/.dotfiles/claude/hooks/clawd-mascot-notif-icon.png ~/.claude/hooks/clawd-mascot-notif-icon.png
