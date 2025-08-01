#[[ -r ~/dev/commbankmobile/Tools/Shared/init.zsh ]] && source ~/dev/commbankmobile/Tools/Shared/init.zsh
export _ENV_SUFFIX=$([[ $USER == karl ]] && echo "local" || echo "work")

# --- Default programs ---

# Preferred editor for local and remote sessions
export EDITOR="nvim"

# --- XDG base locations ---

# Note, these are also set at a login level on macOS using launchctl setenv
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

# --- Application specific XDG paths ---

# For more info see: https://wiki.archlinux.org/title/XDG_Base_Directory
export BUN_INSTALL="$XDG_DATA_HOME/bun"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
export FFMPEG_DATADIR="$XDG_CONFIG_HOME/ffmpeg"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export GOBIN="$GOPATH/bin"
export GOMODCACHE="$XDG_CACHE_HOME/go/mod"
export GOPATH="$XDG_DATA_HOME/go"
export GRADLE_USER_HOME="$XDG_DATA_HOME/gradle"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export OLLAMA_MODELS="$XDG_DATA_HOME/ollama/models"
export REDISCLI_HISTFILE="$XDG_DATA_HOME/redis/rediscli_history"
export REDISCLI_RCFILE="$XDG_CONFIG_HOME/redis/redisclirc"
export RIPGREP_CONFIG_PATH="$XDG_CONFIG_HOME/ripgrep/config"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

[[ -r $ZDOTDIR/.zshenv.$_ENV_SUFFIX ]] && source "$ZDOTDIR/.zshenv.$_ENV_SUFFIX"
