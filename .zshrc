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
alias nv=nvim
alias cat=bat
alias gcan='git commit --amend --no-edit'
alias grcl='git reset --hard && git clean -df'
alias sshadd='ssh-add --apple-use-keychain ~/.ssh/id_ed25519'


export PATH="$HOME/.local/bin:$HOME/go/bin:$PATH"
export EDITOR="nvim"
export VISUAL="nvim"
# export EDITOR="$HOME/.local/bin/lvim"
# export VISUAL="$HOME/.local/bin/lvim"



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

export PATH="/opt/homebrew/opt/go@1.21/bin:$PATH"
export PATH=$(brew --prefix openssh)/bin:$PATH

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"

source "$HOME/.config/broot/launcher/bash/br"
source "$HOME/fzf-git.sh"

export GPG_TTY=$(tty)

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
