export EDITOR="nvim"
export VISUAL="kate"
export MANPAGER="nvim +Man!"
if [ -d "$HOME/.local/share/android-sdk" ]; then
    export ANDROID_SDK_ROOT="$HOME/.local/share/android-sdk"
fi
if [ -d "$HOME/.local/share/mise/shims" ]; then
    export PATH="$HOME/.local/share/mise/shims:$PATH"
fi
