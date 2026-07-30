#!/usr/bin/env bash
#
# Installs this repo's dotfiles as the live configuration in $HOME.
# Vim/neovim config (.vim/, vim-new/, .vimrc) is intentionally out of scope.

set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TIMESTAMP="$(date +%Y%m%d%H%M%S)"

if [[ "$REPO_DIR" != "$HOME/config_files" ]]; then
  echo "WARNING: this repo is at $REPO_DIR, not \$HOME/config_files."
  echo "         .zshrc sources ~/config_files/.zsh/per-directory-history.zsh"
  echo "         by hardcoded path, so that line will break unless the repo"
  echo "         lives at \$HOME/config_files."
fi

declare -A LINKS=(
  [.bashrc]="$HOME/.bashrc"
  [.tmux.conf]="$HOME/.config/tmux/tmux.conf"
  [.zshenv]="$HOME/.zshenv"
  [.zshrc]="$HOME/.zshrc"
  [.gitconfig]="$HOME/.gitconfig"
  [kitty.conf]="$HOME/.config/kitty/kitty.conf"
)

echo "== Symlinking dotfiles =="
for src in "${!LINKS[@]}"; do
  target="${LINKS[$src]}"
  source_path="$REPO_DIR/$src"

  mkdir -p "$(dirname "$target")"

  if [[ -L "$target" && "$(readlink "$target")" == "$source_path" ]]; then
    echo "  already linked: $target"
    continue
  fi

  if [[ -e "$target" || -L "$target" ]]; then
    backup="$target.pre-rtk-install.$TIMESTAMP"
    mv "$target" "$backup"
    echo "  backed up existing $target -> $backup"
  fi

  ln -s "$source_path" "$target"
  echo "  linked: $target -> $source_path"
done

echo
echo "== Installing packages =="
PACKAGES=(zsh tmux fzf ripgrep eza zoxide zsh-syntax-highlighting zsh-autosuggestions python3-pygments)

if [[ -r /etc/os-release ]] && grep -qE '^ID(_LIKE)?=.*\b(ubuntu|debian)\b' /etc/os-release; then
  sudo apt-get update
  sudo apt-get install -y "${PACKAGES[@]}"
else
  echo "  not a Debian/Ubuntu-like system, skipping apt install of: ${PACKAGES[*]}"
fi

echo
echo "== Manual tools =="
for tool in selecta diff-so-fancy; do
  if ! command -v "$tool" >/dev/null 2>&1; then
    echo "  $tool not found on PATH - install manually (see .zshrc aliases)"
  fi
done

echo
echo "Done."
