# Path to your oh-my-zsh installation.
export ZSH=/Users/andrewchen/.oh-my-zsh

# Theme
ZSH_THEME="common"
# oh-my-zsh plugs
plugins=(git wd sudo zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Aliases
source $HOME/.aliases 

# Kitty autocomplete
autoload -Uz compinit
compinit

# Completion for kitty
# kitty + complete setup zsh | source /dev/stdin

# Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# For colorls
source $(dirname $(gem which colorls))/tab_complete.sh

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin:$HOME/go/bin"

# Make Pyenv able to change python versions
eval "$(pyenv init -)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/andrewchen/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/andrewchen/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/andrewchen/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/andrewchen/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
