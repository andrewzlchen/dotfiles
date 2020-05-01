"Variables
let g:mapleader = ' '
let g:maplocalleader = ','

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
call dein#add('ryanoasis/vim-devicons')                              " Dev Icons
call dein#add('itchyny/lightline.vim')
call dein#add('tiagofumo/vim-nerdtree-syntax-highlight')
call dein#add('majutsushi/tagbar')
call dein#add('morhetz/gruvbox')
call dein#add('sainnhe/vim-color-forest-night')
call dein#add('kien/rainbow_parentheses.vim')
call dein#add('sheerun/vim-polyglot')
call dein#add('liuchengxu/vim-which-key')                            " shows what commands are bound to which key

" Fixes Annoying things
call dein#add('Raimondi/delimitMate')                                " Automatic closing of any opening and closing markup/quote/bracket
call dein#add('chrisbra/matchit')                                    " Matching with '%'
call dein#add('scrooloose/nerdcommenter')                            " Comments
call dein#add('Yggdroot/indentLine')                                 " Lines for showing tabs
call dein#add('sbdchd/neoformat')                                    " Automatic formatting
call dein#add('terryma/vim-multiple-cursors')                        " sublime text-like multi cursors
call dein#add('godlygeek/tabular')                                   " tabular formatting
call dein#add('tpope/vim-surround')                                  " quick edits of surrounding quotes/markup/brackets
call dein#add('jiangmiao/auto-pairs')                                " insert or deletion of pairs of quotes, brackets, etc.
call dein#add('mattn/emmet-vim')                                     " emmet integration

" Language/Framework Specific
call dein#add('neoclide/coc.nvim', {'merge':0, 'rev': 'release'})    " LSP Integration
call dein#add('fatih/vim-go')                                        " Great Go plugin
call dein#add('tpope/vim-rails')                                     " Rails Plugin

" File Navigation and Code Searching
set rtp+=/usr/local/opt/fzf
call dein#add('junegunn/fzf.vim')
call dein#add('scrooloose/nerdtree', { 'on_cmd': 'NERDTreeToggle' })
call dein#add('wsdjeg/FlyGrep.vim')
call dein#add('craigemery/vim-autotag')

" Linting/Completion
call dein#add('Shougo/deoplete.nvim')
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')

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
source $HOME/.config/nvim/nvim_config/whichkey.vimrc
source $HOME/.config/nvim/nvim_config/coc.vimrc
