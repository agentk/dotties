# shellcheck disable=SC2139,SC2034,SC1090

# --- Keybindings ---

# List available keybind options with `zle -al`
# Start with emacs editing mode
bindkey -e

# --- Options ---

# List available options and their value with `set -o`
setopt no_case_glob no_case_match # make cmp case insensitive

# --- History ---

HISTSIZE="10000000"
SAVEHIST="10000000"
HISTFILE="$XDG_DATA_HOME/zsh/history"
setopt HIST_FCNTL_LOCK
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_EXPIRE_DUPS_FIRST
setopt SHARE_HISTORY
setopt EXTENDED_HISTORY

# --- Language ---

# You may need to manually set your language environment
export LANG=en_US.UTF-8
[[ $_IS_LINUX ]] && export LC_ALL=C

# --- Command prompt ---

git_branch() {
  git branch --show-current 2>/dev/null | sed 's/.*/ &/'
}
setopt prompt_subst
PROMPT="%B%F{10}%n%f%F{12}@%m%f%b%F{15} %~%f%F{242}\$(git_branch)%f"$'\n'"%# "

# --- Aliases ---

alias caddy-dev='XDG_DATA_HOME="/opt/homebrew/var/lib" /opt/homebrew/opt/caddy/bin/caddy run --config /opt/homebrew/etc/Caddyfile'
alias caddy-fmt='XDG_DATA_HOME="/opt/homebrew/var/lib" /opt/homebrew/opt/caddy/bin/caddy fmt --overwrite --config /opt/homebrew/etc/Caddyfile'
alias cd.='cd ~/.dotfiles'
alias cdd='cd ~/Developer/'
alias cde='cd ~/Developer/Experiments'
alias cdf='cd ~/Developer/docker'
alias cdg='cd ~/Developer/github'
alias cdn='cd ~/notes'
alias find-broken-symlinks='find . \( -name "node_modules" -o -name "Containers" -o -name "Daemon Containers" -o -name "Group Containers" -o -name ".Trash" \) -prune -o -type l -exec test ! -e {} \; -print'
alias gcommit='opencode run "Generate a single line commit message for the staged changes and commit them."'
alias ggcommit="git commit -m \"Automatic update \$(date +'%Y-%m-%d %H:%M:%S')\""
alias gs='git status'
alias l='ls --long --git --no-filesize --icons=always --no-time --no-user --no-permissions'
alias la='ls --all'
alias ll='ls --long --all --all --group --header --icons=always --group-directories-first --sort=Name'
alias lla='ls --long --all'
alias llg='ls --long --all --header --icons=always --git'
alias rmdd='rm -rf ~/dev/Library/Developer/Xcode/DerivedData/ ~/Library/Developer/Xcode/DerivedData/'
alias rrsync='rsync -avh --exclude=.DS_Store'
alias simkill='pkill -9 com.apple.CoreSimulator.CoreSimulatorService'
alias t='ls --tree -dL 4'
alias tree='ls --tree'
alias tt='ls --tree -adL 4'
alias vim=nvim
alias promptly-openai='promptly -c ~/.config/promptly/config.openai.json'
alias promptly-claude='promptly -c ~/.config/promptly/config.claude.json'
alias promptly-deepseek='promptly -c ~/.config/promptly/config.deepseek.json'

# --- Functions ---

f() { if [[ $1 == "" ]]; then open ./; else open "$@"; fi; }

clean-eject() {
  dot_clean "$1"
  rm -rf "$1/.Spotlight-V100"
  rm -rf "$1/.fseventsd"
  find "$1" -name ".DS_Store" -type f -delete
  diskutil eject "$1"
}

ssh-tmux-attach() {
  local SESSION_NAME
  SESSION_NAME=$2
  if [[ ! $SESSION_NAME ]]; then SESSION_NAME=0; fi
  ssh -t "$1" "tmux -u new -As $SESSION_NAME"
}
alias ssht='ssh-tmux-attach'

# --- Bat ---

# Setup with `bat cache --build`
if [[ $_IS_LINUX ]]; then
  if which batcat >/dev/null; then
    alias cat='batcat -Pp'
  else
    echo "Note: bat not installed"
  fi
else
  if which bat >/dev/null; then
    alias cat='bat -Pp'
  else
    echo "Note: bat not installed"
  fi
fi
export BAT_THEME=tokyonight_night

# --- Eza ---

if which eza >/dev/null; then
  alias ls=eza
else
  echo "Note: eza not installed"
fi

# --- Fd ---

[[ $_IS_LINUX ]] && {
  which fdfind >/dev/null && {
    alias fd=fdfind
  }
}

# --- Fzf ---

if which fzf >/dev/null; then
  source <(fzf --zsh)

  # Use tokyo night theme
  # https://github.com/folke/tokyonight.nvim/blob/main/extras/fzf/tokyonight_night.sh
  export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
    --highlight-line \
    --info=inline-right \
    --ansi \
    --layout=reverse \
    --border=none \
    --color=bg+:#283457 \
    --color=bg:#16161e \
    --color=border:#27a1b9 \
    --color=fg:#c0caf5 \
    --color=gutter:#16161e \
    --color=header:#ff9e64 \
    --color=hl+:#2ac3de \
    --color=hl:#2ac3de \
    --color=info:#545c7e \
    --color=marker:#ff007c \
    --color=pointer:#ff007c \
    --color=prompt:#2ac3de \
    --color=query:#c0caf5:regular \
    --color=scrollbar:#27a1b9 \
    --color=separator:#ff9e64 \
    --color=spinner:#ff007c \
  "

  export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'"
  export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

  # -- Use fd instead of fzf --
  export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

  # Use fd (https://github.com/sharkdp/fd) for listing path candidates.
  # - The first argument to the function ($1) is the base path to start traversal
  # - See the source code (completion.{bash,zsh}) for the details.
  _fzf_compgen_path() {
    fd --hidden --exclude .git . "$1"
  }

  # Use fd to generate the list for directory completion
  _fzf_compgen_dir() {
    fd --type=d --hidden --exclude .git . "$1"
  }

  # Advanced customization of fzf options via _fzf_comprun function
  # - The first argument to the function is the name of the command.
  # - You should make sure to pass the rest of the arguments to fzf.
  _fzf_comprun() {
    local command=$1
    shift

    case "$command" in
    cd) fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export | unset) fzf --preview "eval 'echo $'{}" "$@" ;;
    ssh) fzf --preview 'dig {}' "$@" ;;
    *) fzf --preview "bat -n --color=always --line-range :500 {}" "$@" ;;
    esac
  }
else
  echo "Note: fzf not installed"
fi

# --- Java / Android ---

# export JAVA_HOME="$(/usr/libexec/java_home --version 1.8)"
export JAVA_HOME="/Applications/Android Studio.app/Contents/jbr/Contents/Home"
export JDK_HOME="${JAVA_HOME}"
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=~/Library/Android/sdk/tools:$PATH
export PATH=~/Library/Android/sdk/platform-tools:$PATH
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

# --- Mono ---

export DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=1

# --- Python ---

# export PYTHONSTARTUP=~/.pythonrc
# export PATH=$HOME/Library/Python/3.7/bin:$PATH
# export PYTHONPATH=$PYTHONPATH:$HOME/Library/Python/3.7/bin:$HOME/Library/Python/3.7/site-packages
# uv places the user site-packages in ~/.local/bin
export PATH="$HOME/.local/bin:$PATH"

# --- Ruby / RVM ---

export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# --- NVM / Node ---

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# --- pnpm ---

export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
*":$PNPM_HOME:"*) ;;
*) export PATH="$PNPM_HOME:$PATH" ;;
esac

# --- Golang ---

if [[ $_IS_LINUX ]]; then
  export PATH=$PATH:/usr/local/go/bin
else
  export PATH="$HOME/go/bin:$PATH"
fi

# --- Additional paths ---

export PATH="$HOME/.mint/bin:$HOME/.dotfiles/bin:$HOME/bin:$PATH"

# --- Completions ---

# Add ~/.zsh to the beginning of $fpath for custom completions to work
fpath=(~/.zsh/completions $fpath)
fpath+=(/opt/homebrew/share/zsh/site-functions)
autoload -U compinit && compinit

# --- Auto suggestions ---

# Linux
[[ -r /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]] &&
  source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# macOS
[[ -r /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]] &&
  source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# --- Syntax highlighting ---

# Linux
[[ -r /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] &&
  source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# macOS
[[ -r /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] &&
  source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# --- Zoxide ---

# Init here to ensure it's called after compinit
eval "$(zoxide init zsh)"

# --- Environment based extensions ---

[[ -r $ZDOTDIR/.zshrc.$_ENV_SUFFIX ]] && source "$ZDOTDIR/.zshrc.$_ENV_SUFFIX"
