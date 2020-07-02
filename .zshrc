export ZSH="/Users/andrew.chen/.oh-my-zsh"

# get emacs tramp mode to work
if [[ "$TERM" == "dumb" ]]
then
  unsetopt zle
  unsetopt prompt_cr
  unsetopt prompt_subst
  if whence -w precmd >/dev/null; then
      unfunction precmd
  fi
  if whence -w preexec >/dev/null; then
      unfunction preexec
  fi
  PS1='$ '
fi

ZSH_THEME="af-magic"

plugins=(git wd sudo yarn)

source $ZSH/oh-my-zsh.sh
set -o vi

autoload -Uz compinit
compinit

# fzf
source /usr/local/opt/fzf/shell/key-bindings.zsh
source /usr/local/opt/fzf/shell/completion.zsh

source ~/.exports
source ~/.aliases
