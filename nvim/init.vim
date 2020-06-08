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
call dein#add('itchyny/lightline.vim')                               " Bottom status bar
call dein#add('tiagofumo/vim-nerdtree-syntax-highlight')             " Better display in NERDTree
call dein#add('Xuyuanp/nerdtree-git-plugin')                         " Better display in NERDTree
call dein#add('morhetz/gruvbox')                                     " Gruvbox Color theme
call dein#add('sainnhe/vim-color-forest-night')                      " Forest-night color theme
call dein#add('kien/rainbow_parentheses.vim')                        " Rainbow parentheses
call dein#add('joshdick/onedark.vim')                                " One-Dark theme
call dein#add('sheerun/vim-polyglot')                                " Syntax highlighting for various languages

" Quality of Life Improvements
call dein#add('Raimondi/delimitMate')                                " Automatic closing of any opening and closing markup/quote/bracket
call dein#add('chrisbra/matchit')                                    " Matching with '%'
call dein#add('scrooloose/nerdcommenter')                            " Comments
call dein#add('Yggdroot/indentLine')                                 " Lines for showing tabs
call dein#add('sbdchd/neoformat')                                    " Automatic formatting
call dein#add('terryma/vim-multiple-cursors')                        " sublime text-like multi cursors
call dein#add('godlygeek/tabular')                                   " tabular formatting
call dein#add('tpope/vim-surround')                                  " quick edits of surrounding quotes/markup/brackets
call dein#add('jiangmiao/auto-pairs')                                " insert or deletion of pairs of quotes, brackets, etc.
call dein#add('simnalamburt/vim-mundo')                              " visual undo tree
call dein#add('airblade/vim-rooter')                                 " set cwd to project root

" Discoverability
set rtp+=/usr/local/opt/fzf
call dein#add('junegunn/fzf.vim')                                    " Uses the fzf utility to fuzzy search
call dein#add('scrooloose/nerdtree', { 'on_cmd': 'NERDTreeToggle' }) " File tree navigator
call dein#add('wsdjeg/FlyGrep.vim')                                  " Search for symbols using a fuzzy finder
call dein#add('liuchengxu/vim-which-key')                            " shows what commands are bound to which key

" Linting/Completion
"call dein#add('Shougo/deoplete.nvim')                                " Completion engine
call dein#add('ncm2/ncm2')                                            " Completion engine
call dein#add('Shougo/neosnippet.vim')                                " Snippet engine
call dein#add('honza/vim-snippets')                                   " Snippet engine snippets

" Language/Framework Specific
call dein#add('neoclide/coc.nvim', {'merge':0, 'rev': 'release'})    " LSP Integration
call dein#add('fatih/vim-go')                                        " Great Go plugin
call dein#add('luofei614/vim-golang')                                " Golang syntax
call dein#add('tpope/vim-rails')                                     " Rails Plugin
call dein#add('mattn/emmet-vim')                                     " emmet integration
call dein#add('Shougo/echodoc.vim')                                  " Show signature at bottom of window
"call dein#add('vim-scripts/a.vim')                                   " Go to alternate files

" Version Control
call dein#add('tpope/vim-fugitive')                                  " Vim git client
call dein#add('airblade/vim-gitgutter')                              " Shows git changes on side bar
call dein#add('tommcdo/vim-fugitive-blame-ext')                      " shows commit in blame window
call dein#add('rhysd/conflict-marker.vim')                           " hop between git conflicts with [x and ]x

if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
endif
call dein#end()
if dein#check_install()
    call dein#install()
endif

" Overarching configs
source $HOME/.config/nvim/nvim_config/general.vimrc
source $HOME/.config/nvim/nvim_config/keys.vimrc
source $HOME/.config/nvim/nvim_config/commands.vimrc
source $HOME/.config/nvim/nvim_config/behaviors.vimrc

" Category plugin configs
source $HOME/.config/nvim/nvim_config/prog.vimrc
source $HOME/.config/nvim/nvim_config/appearance.vimrc

" Specific plugin configs
source $HOME/.config/nvim/nvim_config/whichkey.vimrc
source $HOME/.config/nvim/nvim_config/coc.vimrc

" Specific language configs
source $HOME/.config/nvim/nvim_config/javascript.vimrc
