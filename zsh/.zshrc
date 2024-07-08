# shellcheck disable=SC2139,SC2034,SC1090

# --- Secrets ---

_secret() { cat ~/.dotfiles/secrets/secrets.json | jq -r ".$1" }

# --- Homebrew ---

export HOMEBREW_CELLAR="/opt/homebrew/Cellar";
export HOMEBREW_GITHUB_API_TOKEN=$(_secret HOMEBREW_GITHUB_API_TOKEN)
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_ENV_HINTS=1
export HOMEBREW_PREFIX="/opt/homebrew";
export HOMEBREW_REPOSITORY="/opt/homebrew";
export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}";
export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:";
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin${PATH+:$PATH}";

# --- Fastfetch ---

# [[ -o login ]] && [[ -o interactive ]] && fastfetch

# --- Powerlevel10k init ---

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# --- History ---

HISTSIZE="10000000"
SAVEHIST="10000000"
HISTFILE="$HOME/.zsh_history"
setopt HIST_FCNTL_LOCK
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_EXPIRE_DUPS_FIRST
setopt SHARE_HISTORY
setopt EXTENDED_HISTORY

[[ $(uname) == Linux ]] && export _IS_LINUX=1

# --- Aliases ---

alias cd.='cd ~/.dotfiles'
alias cdd='cd ~/Developer/'
alias cde='cd ~/Developer/Experiments'
alias cdn='cd ~/notes'
alias ggcommit="git commit -m \"Automatic update \$(date +'%Y-%m-%d %H:%M:%S')\""
alias l='ls --long --git --no-filesize --icons=always --no-time --no-user --no-permissions'
alias la='ls -a'
alias ll='ls -lah --icons=always'
alias lla='ls -la'
alias llg='ls -lah --icons=always --git'
alias rmdd='rm -rf ~/dev/Library/Developer/Xcode/DerivedData/ ~/Library/Developer/Xcode/DerivedData/'
alias rrsync='rsync -avh --exclude=.DS_Store'
alias simkill='pkill -9 com.apple.CoreSimulator.CoreSimulatorService'
alias t='ls --tree -dL 4'
alias tree='ls --tree'
alias tt='ls --tree -adL 4'
alias vim=nvim

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
    if [[ ! $SESSION_NAME ]]; then SESSION_NAME=main; fi
    ssh -t "$1" "tmux -CC new -A -s $SESSION_NAME"
}

# --- Bat ---

# Setup with `bat cache --build`
if [[ $_IS_LINUX ]]; then
  alias cat=batcat
else
  alias cat=bat
fi
export BAT_THEME=tokyonight_night

# --- Eza ---

if [[ $_IS_LINUX ]]; then
  alias ls=exa
else
  alias ls=eza
fi

# --- Ripgrep ---

export RIPGREP_CONFIG_PATH=~/.dotfiles/ripgrep/ripgreprc

# --- Fzf ---

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
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo $'{}"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "bat -n --color=always --line-range :500 {}" "$@" ;;
  esac
}

# --- Java ---

# export JAVA_HOME="$(/usr/libexec/java_home --version 1.8)"
# export JDK_HOME="${JAVA_HOME}"

# --- Mono ---

export DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=1

# --- Python ---

# export PYTHONSTARTUP=~/.pythonrc
# export PATH=$HOME/Library/Python/3.7/bin:$PATH
# export PYTHONPATH=$PYTHONPATH:$HOME/Library/Python/3.7/bin:$HOME/Library/Python/3.7/site-packages

# --- RVM ---

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# --- Misc ---

export PATH="$HOME/.mint/bin:$HOME/.bin:$HOME/bin:$PATH"

# Preferred editor for local and remote sessions
export EDITOR='nvim'

# You may need to manually set your language environment
export LANG=en_US.UTF-8
[[ $_IS_LINUX ]] && export LC_ALL=C

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# --- Completions ---

# Add ~/.zsh to the beginning of $fpath for custom completions to work
fpath=(~/.zsh/completions $fpath)
fpath+=(/opt/homebrew/share/zsh/site-functions)
autoload -U compinit && compinit

# --- Auto suggestions ---

[[ -r /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]] && \
  source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# --- Zoxide ---

# Init here to ensure it's called after compinit
if [[ $_IS_LINUX ]]; then
  eval "$(zoxide init zsh)"
  alias cd=z
  alias cdi=zi
else
  eval "$(zoxide init zsh --cmd cd)"
fi

# --- Powerlevel10k ---

# https://github.com/romkatv/powerlevel10k
[[ -r /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme ]] && \
  source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.dotfiles/zsh/.p10k.zsh.
[[ ! -f ~/.dotfiles/zsh/.p10k.zsh ]] || source ~/.dotfiles/zsh/.p10k.zsh

if [[ $USER == bowdeka || $USER == karl.bowden ]]; then
  [[ -r ~/.zshrc.work ]] && source ~/.zshrc.work
else
  [[ -r ~/.zshrc.local ]] && source ~/.zshrc.local
fi

