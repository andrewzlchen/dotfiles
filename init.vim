" A (not so) minimal vimrc.
"
" You want Vim, not vi. When Vim finds a vimrc, 'nocompatible' is set anyway.
" We set it explicitely to make our position clear!
set nocompatible

filetype plugin indent on         " Load plugins according to detected filetype.
syntax on                         " Enable syntax highlighting.

set autoindent                    " Indent according to previous line.
set expandtab                     " Use spaces instead of tabs.
set softtabstop =4                " Tab key indents by 4 spaces.
set shiftwidth  =4                " >> indents by 4 spaces.
set shiftround                    " >> indents to next multiple of 'shiftwidth'.

set backspace   =indent,eol,start " Make backspace work as you would expect.
set hidden                        " Switch between buffers without having to save first.
set laststatus  =2                " Always show statusline.
set display     =lastline         " Show as much as possible of the last line.

set showmode                      " Show current mode in command-line.
set showcmd                       " Show already typed keys when more are expected.

set incsearch                     " Highlight while searching with / or ?.
set hlsearch                      " Keep matches highlighted.

set ttyfast                       " Faster redrawing.
set lazyredraw                    " Only redraw when necessary.

set splitbelow                    " Open new windows below the current window.
set splitright                    " Open new windows right of the current window.

set cursorline                    " Find the current line quickly.
set wrapscan                      " Searches wrap around end-of-file.
set report      =0                " Always report changed lines.
set synmaxcol   =200              " Only highlight the first 200 columns.

set mouse=a
set relativenumber
set number

set list                          " Show non-printable characters.

au BufNewFile,BufRead *.py        " defaults for Python Editing 
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

if has('multi_byte') && &encoding ==# 'utf-8'
    let &listchars = 'tab:▸ ,extends:❯,precedes:❮,nbsp:±'
else
    let &listchars = 'tab:> ,extends:>,precedes:<,nbsp:.'
endif

" The fish shell is not very compatible to other shells and unexpectedly
" breaks things that use 'shell'.
if &shell =~# 'fish$'
    set shell=/bin/bash
endif

scriptencoding utf-8

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

" Behavior
call dein#add('skywind3000/asyncrun.vim')

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

" Code Searching
call dein#add('mileszs/ack.vim')
call dein#add('craigemery/vim-autotag')

" Language/Framework Specific

    " Markdown
    call dein#add('plasticboy/vim-markdown')
    call dein#add('dkarter/bullets.vim')

    " HTML
    call dein#add('mattn/emmet-vim')

    " Ruby / Rails
    "call dein#add('tpope/vim-rails')
    "call dein#add('tpope/vim-rvm')
    call dein#add('vim-ruby/vim-ruby')
    
    " Javascript
    call dein#add('pangloss/vim-javascript')
    call dein#add('mxw/vim-jsx')

    " Elixir
    call dein#add('elixir-editors/vim-elixir')

    " CSS
    "call dein#add('cakebaker/scss-syntax.vim')

" File Navigation
set rtp+=/usr/local/opt/fzf
call dein#add('junegunn/fzf.vim')
call dein#add('scrooloose/nerdtree', { 'on_cmd': 'NERDTreeToggle' })

" Linting/Completion
call dein#add('neoclide/coc.nvim', { "build": "call coc#util#install()"})
call dein#add('autozimu/LanguageClient-neovim', {
    \ 'rev': 'next',
    \ 'build': 'bash install.sh',
    \ })

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

" SETTINGS

    filetype plugin indent on

    " Colorscheme
    set background=dark
    colo gruvbox
    if(has("termguicolors"))
        set termguicolors
    endif

    let g:seiya_target_groups = has('nvim') ? ['guibg'] : ['ctermbg']
    let g:seiya_auto_enable=1
    hi Normal guibg=NONE ctermbg=NONE
    hi LineNr guibg=NONE ctermfg=NONE

    " Emmet
    let g:user_emmet_leader_key="vv"
    let g:user_emmet_settings = {
    \  'javascript.jsx' : {
        \      'extends' : 'jsx',
        \  },
    \}

    " Disable arrow keys
    nnoremap <Left> :echo "No left for you!"<CR>
    nnoremap <Right> :echo "No right for you!"<CR>
    nnoremap <Up> :echo "No up for you!"<CR>
    nnoremap <Down> :echo "No down for you!"<CR>

    " Folds
    "map <Leader>zf :set foldmethod=indent<Enter>

    " Ack
    " use silver searcher instead of ack
    let g:ackprg = 'ag --vimgrep'

    " JSON highlighter
    " Not conceal double quotes in json
    let g:vim_json_syntax_conceal = 0

    "" LSP
    set hidden

    let g:LanguageClient_serverCommands = {
        \ 'javascript': ['javascript-typescript-langserver'],
        \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
        \ 'typescript': ['javascript-typescript-langserver'],
        \ 'python': ['/Users/andrewchen/.pyenv/shims/pyls'],
        \ }

    nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
    nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
    nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>


" MAPS

    " NerdTree
    map <leader>tf :NERDTreeToggle<CR>
    map <leader>r :NERDTreeFind<cr>

    " fzf
    map <leader>f :Files<cr>
    map <leader>bl :Buffers<cr>
    map <leader>al :Lines<cr>
    map <leader>cl :BLines<cr>

    " Neoformat
    map <Leader>cf :Neoformat<Enter>

    " Fugitive
    map <Leader>gst :Gstatus<Enter>
    map <Leader>gcmsg :Gcommit<Enter>
    map <Leader>gaa :Gwrite<Enter>
    map <Leader>ga :Gwrite<Space>
    map <Leader>gp :Gpush<Enter>
    map <Leader>gb :Gblame<Enter>
    map <Leader>gl :Gpull<Enter>
    map <Leader>gg :Glog<Enter>

    " Mapping buffers
    nnoremap <Leader>bd :bd<CR>
    nnoremap <Leader>bp :bp<CR>
    nnoremap <Leader>bn :bn<CR>

    " Split navigations
    nnoremap <leader>j <C-W><C-J>
    nnoremap <leader>k <C-W><C-K>
    nnoremap <leader>l <C-W><C-L>
    nnoremap <leader>h <C-W><C-H>

    " Search code
    map <Leader>s :Ack<Space>

    " Tagbar: See the structure of the current file via tags
    map <leader>tt :TagbarToggle<CR>

    " Run Python on current file
    nnoremap <buffer> <Leader>a :exec '!python3' shellescape(@%, 1)<cr>


inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<CR>"

