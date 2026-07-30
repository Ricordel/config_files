# Ubuntu's /etc/zsh/zshrc runs its own uncached `compinit` unless this is set
# before it loads. We do our own cached compinit in .zshrc, so skip theirs.
skip_global_compinit=1

. "$HOME/.cargo/env"

# Begin added by argcomplete
fpath=( /home/yoann.ricordel/.local/lib/python3.10/site-packages/argcomplete/bash_completion.d "${fpath[@]}" )
# End added by argcomplete
