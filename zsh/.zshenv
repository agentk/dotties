export XDG_CONFIG_HOME="$HOME/.config"

[[ -f "$HOME/.cargo/env" ]] && . "$HOME/.cargo/env"

if [[ $USER == bowdeka || $USER == karl.bowden ]]; then
  [[ -r ~/.zshenv.work ]] && source ~/.zshenv.work
else
  [[ -r ~/.zshenv.local ]] && source ~/.zshenv.local
fi
