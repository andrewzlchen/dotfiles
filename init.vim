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

au BufNewFile,BufRead *.js, *.html, *.css       " Defaults for web dev
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

" Tab width 
"autocmd FileType html :setlocal sw=2 ts=2 sts=2 " Two spaces for HTML files "
"autocmd FileType javascript :setlocal sw=2 ts=2 sts=2 " Two spaces for HTML files "

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
    "call dein#add('vim-ruby/vim-ruby')
    "
    " Javascript
    call dein#add('pangloss/vim-javascript')
    call dein#add('mxw/vim-jsx')

    " JSON
    call dein#add('elzr/vim-json')

    " CSS
    "call dein#add('cakebaker/scss-syntax.vim')

" File Navigation
set rtp+=/usr/local/opt/fzf
"call dein#add('/usr/local/opt/fzf')
call dein#add('junegunn/fzf.vim')
call dein#add('scrooloose/nerdtree', { 'on_cmd': 'NERDTreeToggle' })

" Linting/Completion
call dein#add('Shougo/deoplete.nvim')
call dein#add('w0rp/ale')
call dein#add('SirVer/ultisnips')
call dein#add('honza/vim-snippets')

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

" NerdTree
map <C-N> :NERDTreeToggle<CR>
map <leader>r :NERDTreeFind<cr>

" deoplete
let g:deoplete#enable_at_startup = 1
inoremap <expr><BS> deoplete#smart_close_popup()."\<C-h>"
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ deoplete#mappings#manual_complete()
function! s:check_back_space() abort "{{{
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

" ALE
let g:ale_fixers = {
            \   'javascript': ['prettier'],
            \   'css': ['prettier'],
            \}
let g:ale_linters_explicit = 1
let g:ale_fix_on_save = 1

" Emmet
let g:user_emmet_leader_key="vv"
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}

" fzf
function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction
command! ProjectFiles execute 'Files' s:find_git_root()
map <leader>s :ProjectFiles<cr>

" Javascript settings
autocmd BufWritePost *.js AsyncRun -post=checktime ./node_modules/.bin/eslint --fix % " run formatter asynchronously

" ctrlp
"let g:ctrlp_root_markers=['.root']
"let g:ctrlp_custom_ignore = {
            "\ 'dir':  'node_modules\|DS_Store\|git\|system',
            "\ 'file': '\v\.(exe|so|dll|o|a)$',
            "\ 'link': 'some_bad_symbolic_links',
            "\ }
"let g:ctrlp_extensions = ['tag']
"nnoremap <leader>. :CtrlPTag<cr>

" Code formatter
map <Leader>cf :Neoformat<Enter>
let g:formatterpath = []

" Fugitive
map <Leader>gst :Gstatus<Enter>
map <Leader>gcmsg :Gcommit<Enter>
map <Leader>gaa :Gwrite<Enter>
map <Leader>ga :Gwrite<Space>
map <Leader>gp :Gpush<Enter>
map <Leader>gb :Gblame<Enter>
map <Leader>gl :Gpull<Enter>
map <Leader>gg :Glog<Enter>


" Disable arrow keys
nnoremap <Left> :echo "No left for you!"<CR>
nnoremap <Right> :echo "No right for you!"<CR>
nnoremap <Up> :echo "No up for you!"<CR>
nnoremap <Down> :echo "No down for you!"<CR>

" Mapping buffers
nnoremap <Leader>d :bd<CR>
nnoremap <Leader>l :ls<CR>
nnoremap <Leader>p :bp<CR>
nnoremap <Leader>n :bn<CR>
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

" Ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Ack
" use silver searcher instead of ack
let g:ackprg = 'ag --vimgrep'
map <Leader>f :Ack<Space>

" JSON highlighter
" Not conceal double quotes in json
let g:vim_json_syntax_conceal = 0

" Tagbar: See the structure of the current file via tags
map <leader>t :TagbarToggle<CR>

" Run Python on current file
nnoremap <buffer> <Leader>a :exec '!python3' shellescape(@%, 1)<cr>


