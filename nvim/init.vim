" Variables
let g:mapleader = ' '
let g:maplocalleader = '\'

let g:dein_repo = 'https://github.com/Shougo/dein.vim.git'
let g:dein_dir = '~/.config/nvim/dein/repos/github.com/Shougo/dein.vim'

" Plugin Manager
if empty(glob(g:dein_dir))
    exec 'silent !mkdir -p '.g:dein_dir
    exec '!git clone '.g:dein_repo.' '.g:dein_dir
endif
exec 'set runtimepath^='.g:dein_dir

call dein#begin(expand('~/.config/nvim/dein'))

call dein#add('Shougo/dein.vim')

" Appearance
call dein#add('ryanoasis/vim-devicons')
call dein#add('itchyny/lightline.vim')
call dein#add('tiagofumo/vim-nerdtree-syntax-highlight')
call dein#add('majutsushi/tagbar')
call dein#add('airblade/vim-gitgutter')
call dein#add('morhetz/gruvbox')

" Fixes Annoying things
call dein#add('Raimondi/delimitMate')
call dein#add('chrisbra/matchit')
call dein#add('scrooloose/nerdcommenter')
call dein#add('Yggdroot/indentLine')
call dein#add('sbdchd/neoformat')
call dein#add('terryma/vim-multiple-cursors')
call dein#add('godlygeek/tabular')
call dein#add('terryma/vim-expand-region')
call dein#add('tpope/vim-surround')
call dein#add('jiangmiao/auto-pairs')
call dein#add('mattn/emmet-vim')

" Language/Framework Specific
call dein#add('neoclide/coc.nvim', {'merge':0, 'rev': 'release'})
call dein#add('fatih/vim-go')
call dein#add('tpope/vim-rails')

" File Navigation and Code Searching
set rtp+=/usr/local/opt/fzf
call dein#add('junegunn/fzf.vim')
call dein#add('scrooloose/nerdtree', { 'on_cmd': 'NERDTreeToggle' })
call dein#add('wsdjeg/FlyGrep.vim')
call dein#add('craigemery/vim-autotag')

" Linting/Completion
"call dein#add('w0rp/ale')
"call dein#add('Shougo/deoplete.nvim')

" Version Control
call dein#add('tpope/vim-fugitive')
call dein#add('airblade/vim-gitgutter')

if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
endif
call dein#end()
if dein#check_install()
    call dein#install()
endif

source $HOME/.config/nvim/nvim_config/general.vimrc
source $HOME/.config/nvim/nvim_config/keys.vimrc
source $HOME/.config/nvim/nvim_config/plugins.vimrc
source $HOME/.config/nvim/nvim_config/coc.vimrc
