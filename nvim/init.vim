


let g:dein_repo = 'https://github.com/Shougo/dein.vim.git'
let g:dein_dir = '~/.config/nvim/dein/repos/github.com/Shougo/dein.vim'

" Plugins!
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
call dein#add('rafi/awesome-vim-colorschemes')                       " Color themes
call dein#add('luochen1990/rainbow')                                 " Rainbow parentheses
call dein#add('mhinz/vim-startify')                                  " Start screen
call dein#add('junegunn/goyo.vim')                                   " Zen mode
call dein#add('Yggdroot/indentLine')                                 " Lines for showing tabs
call dein#add('gko/vim-coloresque')                                  " Colors in Vim #f00 #0f0 #00f

" Quality of Life Improvements
call dein#add('tpope/vim-commentary')                                " Comments
call dein#add('terryma/vim-multiple-cursors')                        " sublime text-like multi cursors
call dein#add('simnalamburt/vim-mundo')                              " visual undo tree
call dein#add('godlygeek/tabular')                                   " tabular formatting
call dein#add('tpope/vim-surround')                                  " quick edits of surrounding quotes/markup/brackets
call dein#add('airblade/vim-rooter')                                 " set cwd to project root
call dein#add('justinmk/vim-sneak')                                  " fast motion

" Discoverability
set rtp+=/usr/local/opt/fzf
call dein#add('junegunn/fzf.vim')                                    " Uses the fzf utility to fuzzy search
call dein#add('liuchengxu/vim-which-key')                            " shows what commands are bound to which key
call dein#add('tpope/vim-projectionist')                             " Sets up associations/behaviors between files
call dein#add('majutsushi/tagbar')                                   " File function outliner

" Linting/Completion
"call dein#add('Shougo/deoplete.nvim')                                " Completion engine
call dein#add('ncm2/ncm2')                                            " Completion engine
call dein#add('Shougo/neosnippet.vim')                                " Snippet engine
call dein#add('honza/vim-snippets')                                   " Snippet engine snippets

" Language/Framework Specific
call dein#add('neoclide/coc.nvim', {'merge':0, 'rev': 'release'})    " LSP Integration
call dein#add('sheerun/vim-polyglot')                                " Syntax for various languages
call dein#add('fatih/vim-go')                                        " Great Go plugin
"call dein#add('tpope/vim-rails')                                     " Rails Plugin
call dein#add('mattn/emmet-vim')                                     " emmet integration
call dein#add('timonv/vim-cargo')                                    " Cargo bindings

" Programming
call dein#add('Shougo/echodoc.vim')                                  " Show signature at bottom of window
call dein#add('vim-test/vim-test')                                   " Test framework plugin

" Version Control
call dein#add('tpope/vim-fugitive')                                  " Vim git client
call dein#add('tpope/vim-rhubarb')                                   " Open Github for open files in vim
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
source $HOME/.config/nvim/nvim_config/general.vimrc    " General settings
source $HOME/.config/nvim/nvim_config/appearance.vimrc " Appearances settings
source $HOME/.config/nvim/nvim_config/behaviors.vimrc  " General vim behavior
source $HOME/.config/nvim/nvim_config/keys.vimrc       " Keybindings not in whichkey
source $HOME/.config/nvim/nvim_config/commands.vimrc   " Creating commands
source $HOME/.config/nvim/nvim_config/prog.vimrc       " Programming Configs

" Plugin-specific configs
source $HOME/.config/nvim/nvim_config/whichkey.vimrc
source $HOME/.config/nvim/nvim_config/coc.vimrc
source $HOME/.config/nvim/nvim_config/startify.vimrc
source $HOME/.config/nvim/nvim_config/projectionist.vimrc
source $HOME/.config/nvim/nvim_config/vimtest.vimrc
source $HOME/.config/nvim/nvim_config/sneak.vimrc
