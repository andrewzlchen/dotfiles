# Path to your oh-my-zsh installation.
export ZSH=/Users/andrewchen/.oh-my-zsh

ZSH_THEME=""

DISABLE_AUTO_TITLE="true"

plugins=(git wd sudo zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Vim Key bindings
#bindkey -v
#export KEYTIMEOUT=1

# Pure Color theme
autoload -U promptinit; promptinit
PURE_CMD_MAX_EXEC_TIME=10
prompt pure

alias p3="python3"
alias v="nvim"
alias rchunk="brew services restart chunkwm"
alias rskhd="brew services restart skhd"
alias vr="nvim ~/.config/nvim/init.vim"
alias zr="nvim ~/.zshrc"
alias cr="nvim ~/.chunkwmrc"
alias skhr="nvim ~/.skhdrc"
alias linuxlab="ssh achen8@rainman.srcit.stevens-tech.edu"
alias sshll='ssh locallending@ww1.bensommer.net'
alias sshhome='ssh andrew@chen-server.mynetgear.com'
alias pip='pip3'
alias b='brew'
alias bc='brew cask'
alias lc='colorls'
alias ubuntu='docker start zealous_kirch && docker attach zealous_kirch'
alias ltref='open ~/Documents/useful/latex-guide.pdf'
alias ltcp="tmux -c 'latexmk -pdf -pvc -shell-escape main.tex'"
alias tzip='tar -czvf'
alias geth159='~/Desktop/go-ethereum-1.5.9/build/bin/geth'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

### Added by the Bluemix CLI
source /usr/local/Bluemix/bx/zsh_autocomplete

source $(dirname $(gem which colorls))/tab_complete.sh
