"
" A (not so) minimal vimrc.
"

" You want Vim, not vi. When Vim finds a vimrc, 'nocompatible' is set anyway.
" We set it explicitely to make our position clear!
set nocompatible

filetype plugin indent on  " Load plugins according to detected filetype.
syntax on                  " Enable syntax highlighting.

set autoindent             " Indent according to previous line.
set expandtab              " Use spaces instead of tabs.
set softtabstop =4         " Tab key indents by 4 spaces.
set shiftwidth  =4         " >> indents by 4 spaces.
set shiftround             " >> indents to next multiple of 'shiftwidth'.

set backspace   =indent,eol,start  " Make backspace work as you would expect.
set hidden                 " Switch between buffers without having to save first.
set laststatus  =2         " Always show statusline.
set display     =lastline  " Show as much as possible of the last line.

set showmode               " Show current mode in command-line.
set showcmd                " Show already typed keys when more are expected.

set incsearch              " Highlight while searching with / or ?.
set hlsearch               " Keep matches highlighted.

set ttyfast                " Faster redrawing.
set lazyredraw             " Only redraw when necessary.

set splitbelow             " Open new windows below the current window.
set splitright             " Open new windows right of the current window.

set cursorline             " Find the current line quickly.
set wrapscan               " Searches wrap around end-of-file.
set report      =0         " Always report changed lines.
set synmaxcol   =200       " Only highlight the first 200 columns.

set mouse=a
set number

set list                   " Show non-printable characters.
if has('multi_byte') && &encoding ==# 'utf-8'
    let &listchars = 'tab:▸ ,extends:❯,precedes:❮,nbsp:±'
else
    let &listchars = 'tab:> ,extends:>,precedes:<,nbsp:.'
endif

autocmd FileType javascript setlocal shiftwidth=2 tabstop=2

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
    call dein#add('mhartington/oceanic-next')
    call dein#add('ryanoasis/vim-devicons')
    call dein#add('vim-airline/vim-airline')
    " Fixes Annoying things
    call dein#add('Raimondi/delimitMate')
    call dein#add('chrisbra/matchit')
    call dein#add('scrooloose/nerdcommenter')
    call dein#add('Yggdroot/indentLine')
    call dein#add('Chiel92/vim-autoformat')
    call dein#add('godlygeek/tabular')

    " Language/Framework Specific
    call dein#add('plasticboy/vim-markdown')
    call dein#add('mattn/emmet-vim')
    call dein#add('tpope/vim-rails')

    " Navigation
    call dein#add('ctrlpvim/ctrlp.vim')
    call dein#add('scrooloose/nerdtree', { 'on_cmd': 'NERDTreeToggle' })

    " Linting/Completion
    call dein#add('Shougo/deoplete.nvim')
    call dein#add('w0rp/ale')
    call dein#add('honza/vim-snippets')

    " Version Control
    call dein#add('tpope/vim-fugitive')

if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
endif
call dein#end()
if dein#check_install()
    call dein#install()
endif

filetype plugin indent on

" Colorscheme
set background=dark
colo OceanicNext
let g:airline_theme='oceanicnext'
if(has("termguicolors"))
    set termguicolors
endif

let g:seiya_target_groups = has('nvim') ? ['guibg'] : ['ctermbg']
let g:seiya_auto_enable=1
hi Normal guibg=NONE ctermbg=NONE
hi LineNr guibg=NONE ctermfg=NONE

"let g:vimfiler_ignore_pattern = ''

" NerdTree
map <C-N> :NERDTreeToggle<CR>

" deoplete
let g:deoplete#enable_at_startup = 1
"let g:deoplete#enable_smart_case = 1
inoremap <expr><BS> deoplete#smart_close_popup()."\<C-h>"
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ deoplete#mappings#manual_complete()
function! s:check_back_space() abort "{{{
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

let g:ale_fixers = {
            \   'javascript': ['eslint'],
            \}

" Set this setting in vimrc if you want to fix files automatically on save.
" This is off by default.
"let g:ale_fix_on_save = 1

" Emmet
let g:user_emmet_leader_key="vv"

" ctrlp
let g:ctrlp_root_markers=['.root']
let g:ctrlp_custom_ignore = {
            \ 'dir':  'node_modules\|DS_Store\|git',
            \ 'file': '\v\.(exe|so|dll|o|a)$',
            \ 'link': 'some_bad_symbolic_links',
            \ }

" Personal keybindings
inoremap <Space><Tab> <Esc>/(<>)<Enter>v3ldi
vnoremap <Space><Tab> <Esc>/(<>)<Enter>v3ldi
map <Space><Tab> <Esc>/(<>)<Enter>v3ldi
nmap <Leader>r :NERDTreeFocus<cr>R<c-w><c-p>:CtrlPClearCache<cr>

inoremap xx <%=  %><Esc>2hi
inoremap xc <%  %><Esc>2hi

" Code formatter
map <Leader>cf :Autoformat<Enter>
let g:formatterpath = []

" Fugitive
map <Leader>gs :Gstatus<Enter>
map <Leader>gp :Gpush<Enter>
map <Leader>gb :Gblame<Enter>
map <Leader>gl :Gpull<Enter>


" Disable arrow keys
nnoremap <Left> :echo "No left for you!"<CR>
nnoremap <Right> :echo "No right for you!"<CR>
nnoremap <Up> :echo "No up for you!"<CR>
nnoremap <Down> :echo "No down for you!"<CR>

" Mapping buffers
nnoremap <Leader>d :bd<CR>
nnoremap <Leader>l :ls<CR>
nnoremap <Leader>b :bp<CR>
nnoremap <Leader>f :bn<CR>
nnoremap <Leader>g :e#<CR>
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>

" Folds
map <Leader>zf :set foldmethod=indent<Enter>
