# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=/home/achen/.oh-my-zsh

ZSH_THEME="robbyrussell"

plugins=(git wd sudo)

source $ZSH/oh-my-zsh.sh

# Aliases
alias v="vim"
alias vr="vim ~/.vimrc"
alias ir="vim ~/.config/i3/config"
alias zr="vim ~/.zshrc"
alias tr="vim ~/.config/termite/config"
alias i3br="vim ~/.i3blocks.conf"
alias docker-dev='docker run -p 443:7777 --name dev-nsm -e NETNSM_SERVER=157.191.32.98 -e NETNSM_PORT=3311 -e NETNSM_USR=ore-net-eng -e NETNSM_PWD=orenet2017 -e NETNSM_DB=net-nsm -it nsmgui:axios bash'

PATH="/home/achen/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/achen/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/achen/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/achen/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/achen/perl5"; export PERL_MM_OPT;
source /usr/share/nvm/init-nvm.sh
