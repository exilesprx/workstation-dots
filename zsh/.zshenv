export EDITOR="nvim"
export VISUAL="kate"
export MANPAGER="nvim +Man!"
if [ -d "$HOME/.local/share/mise/shims" ]; then
    export PATH="$HOME/.local/share/mise/shims:$PATH"
fi
