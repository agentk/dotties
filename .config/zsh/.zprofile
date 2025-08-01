# shellcheck disable=SC2139,SC2034,SC1090

[[ $(uname) == Linux ]] && export _IS_LINUX=1

# --- Homebrew ---

# Homebrew first so the path is usable by other setup
eval "$(/opt/homebrew/bin/brew shellenv)"
export HOMEBREW_GITHUB_API_TOKEN=$("$HOME/.dotfiles/bin/sops-read" HOMEBREW_GITHUB_API_TOKEN)
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_ENV_HINTS=1
