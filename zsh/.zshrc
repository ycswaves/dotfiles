#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

alias python=python3
alias lv=lvim

export PATH="$HOME/.local/bin:$PATH"
export EDITOR="$HOME/.local/bin/lvim"
export VISUAL="$HOME/.local/bin/lvim"


# Customize to your needs...
bindkey -v
bindkey -M viins 'jj' vi-cmd-mode

# Enable iex Shell History
export ERL_AFLAGS="-kernel shell_history enabled"


gcob() {
 gb | grep $1 | xargs git checkout
}

. /opt/homebrew/opt/asdf/libexec/asdf.sh

if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi

