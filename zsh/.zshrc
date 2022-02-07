# zmodload zsh/zprof
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

# Customize to your needs...

# alias python='python3'
# alias lv=lvim

# zprof

bindkey -v
bindkey -M viins 'jj' vi-cmd-mode

# Enable iex Shell History
export ERL_AFLAGS="-kernel shell_history enabled"

gcob() {
  gb | grep $1 | xargs git checkout
}


# start tmux
# if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
#     tmux attach -t default || tmux new -s default
# fi
