"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""    BASIC CONFIG     """"""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()
   " General Vim
       Plugin 'gmarik/Vundle.vim'           " vim plugin manager
       Plugin 'tpope/vim-fugitive'          " git wrapper
    " Completion
       Plugin 'w0rp/ale'                    " asynchronous completion engine
       Plugin 'Supertab'                    " tab completion
       Plugin 'Raimondi/delimitMate'        " completes quotes, parens, etc.
       Plugin 'scrooloose/nerdcommenter'    " automatically comments
    " File Searching
       Plugin 'scrooloose/nerdtree'         " file tree viewer
       Plugin 'wincent/command-t'           " looks for tags
       Plugin 'ctrlpvim/ctrlp.vim'          " fuzzy file searcher
       Plugin 'majutsushi/tagbar'           " displays a tags window of the current file
    " Appearance
       Plugin 'morhetz/gruvbox'             " gruvbox color theme
       Plugin 'chriskempson/base16-vim'     " base16 color themes
       Plugin 'Yggdroot/indentLine'         " displays thin vertical lines at each indentation level 
       Plugin 'vim-airline/vim-airline'     " bottom status bar
       Plugin 'vim-airline/vim-airline-themes'
call vundle#end()

" Basic Config
let g:mapleader = ' '
let g:maplocalleader = '\'
syntax enable
set nocompatible
filetype plugin on
filetype plugin indent on
set mouse=a

" Fix backspace issue
set backspace=2  "compatible with version 5.4 and earlier

" Appearances
set number
set relativenumber
set t_Co=256
colorscheme base16-google-dark
hi LineNr ctermfg=darkgrey ctermbg=black

" Tab Behavior
set expandtab
set smarttab
set tabstop=4       
set shiftwidth=4 
set softtabstop=4
set expandtab



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""     KEYBINDINGS     """"""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" File searching
    " open NERDTree
    nmap <Leader>ft :NERDTreeToggle<CR>
    nmap <Leader>fr :NERDTreeFind<CR>

    " ctrlp
    nmap <Leader>ff :CtrlP<CR>

    " toggle tagbar
    nmap <Leader>tb :TagbarToggle<CR>

" Mapping buffers
nmap <Leader>d :bd<CR>
nmap <Leader>l :ls<CR>
nmap <Leader>p :bp<CR>
nmap <Leader>n :bn<CR>

" Disable arrow keys
nmap <Left> :echo "No left for you!"<CR>
nmap <Right> :echo "No right for you!"<CR>
nmap <Up> :echo "No up for you!"<CR>
nmap <Down> :echo "No down for you!"<CR>

" Spacemacs-like commands
nmap <Leader>x :x<CR>
nmap <Leader>w :w<CR>

" Remap commonly mistyped commands
command -complete=file -bang -nargs=? W :w<bang> <args>
command -complete=file -bang -nargs=? Wq :wq<bang> <args>
command -complete=file -bang -nargs=? WQ :wq<bang> <args>
command -complete=file -bang -nargs=? Q :q<bang> <args>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""  PLUGIN-SPECIFIC CONFIG  """"""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Airline
let g:airline#extensions#tabline#enabled = 1        " enable buffer line
let g:airline_theme='bubblegum'

" Ctrlp
set wildignore+=*/tmp/*,*.so,*.swp,*.zip                " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe             " Windows
set wildignore+=*/node_modules/*,*\\node_modules\\*     " Node.js/Javascript

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|o)$',
  \ }

let g:ctrlp_user_command = 'git ls-files %s'       " MacOSX/Linux

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""  HELP DOCUMENTATION """"""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Put these lines at the very end of your vimrc file.

" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL
