# if [ -z "$TMUX" ]; then
#   exec tmux new-session -A -s workspace
# fi
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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
alias cat=bat

export PATH="$HOME/.local/bin:$HOME/go/bin:$PATH"
export EDITOR="$HOME/.local/bin/lvim"
export VISUAL="$HOME/.local/bin/lvim"



# Customize to your needs...
bindkey -v
bindkey -M viins 'jj' vi-cmd-mode

# Enable iex Shell History
export ERL_AFLAGS="-kernel shell_history enabled"

# helpers
gcob() {
  gb | fzf | xargs git checkout
}

gbde() {
  gb | fzf -m | xargs git branch -D
}

. $(brew --prefix asdf)/libexec/asdf.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
