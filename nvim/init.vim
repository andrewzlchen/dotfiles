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

" Dependencies
call dein#add('tpope/vim-dispatch')

" Appearance
call dein#add('kyazdani42/nvim-web-devicons')                        " Dev Icons
call dein#add('itchyny/lightline.vim')                               " Bottom status bar
call dein#add('rafi/awesome-vim-colorschemes')                       " Color themes
call dein#add('luochen1990/rainbow')                                 " Rainbow parentheses
call dein#add('junegunn/goyo.vim')                                   " Zen mode
call dein#add('Yggdroot/indentLine')                                 " Lines for showing tabs
call dein#add('szw/vim-maximizer')                                   " toggle maximizing buffers
call dein#add('gko/vim-coloresque')                                  " Colors in Vim #f00 #0f0 #00f
call dein#add('tpope/vim-unimpaired')                                " pair keymaps

" Quality of Life Improvements
call dein#add('tpope/vim-commentary')                                " Comments
call dein#add('terryma/vim-multiple-cursors')                        " sublime text-like multi cursors
call dein#add('tpope/vim-surround')                                  " quick edits of surrounding quotes/markup/brackets
call dein#add('airblade/vim-rooter')                                 " set cwd to project root
" call dein#add('guns/vim-sexp')                                       " adds text motions for working with lisps
" call dein#add('tpope/vim-sexp-mappings-for-regular-people')          " better mappings for vim-sexp

" Discoverability
call dein#add('nvim-lua/popup.nvim')                                 " dependency for telescope
call dein#add('nvim-lua/plenary.nvim')                               " dependency for telescope
call dein#add('nvim-telescope/telescope.nvim')                       " extensible fuzzy finder
call dein#add('liuchengxu/vim-which-key')                            " shows what commands are bound to which key
call dein#add('tpope/vim-projectionist')                             " Sets up associations/behaviors between files
call dein#add('majutsushi/tagbar')                                   " File function outliner
call dein#add('kyazdani42/nvim-tree.lua')                            " File tree explorer

" Linting/Completion
call dein#add('ncm2/ncm2')                                            " Completion engine
call dein#add('Shougo/neosnippet.vim')                                " Snippet engine
call dein#add('honza/vim-snippets')                                   " Snippet engine snippets

" Programming
call dein#add('Shougo/echodoc.vim')                                  " Show signature at bottom of window
call dein#add('neovim/nvim-lspconfig')                               " Builtin LSP Config
call dein#add('nvim-lua/completion-nvim')                            " Completions for builtin lsp
call dein#add('vim-test/vim-test')                                   " Test framework plugin
call dein#add('mattn/emmet-vim')                                     " emmet integration
call dein#add('fatih/vim-go')                                        " golang
call dein#add('Olical/conjure')                                      " lisp-like langs

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

lua require 'init'
