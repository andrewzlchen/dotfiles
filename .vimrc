" This file belongs in root folder

set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()
"" let Vundle manage Vundle

" Vundle Plugins

Plugin 'gmarik/Vundle.vim'
Plugin 'Markdown'
Plugin 'Markdown-syntax'
Plugin 'Syntastic'
Plugin 'Supertab'
Plugin 'flazz/vim-colorschemes'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'easymotion/vim-easymotion'
Plugin 'scrooloose/nerdcommenter'

call vundle#end() 	        	" required
filetype plugin indent on       " required

" UI
set number
syntax enable
set t_Co=256
colorscheme gruvbox 
hi Normal guibg=NONE ctermbg=NONE
set laststatus=2 statusline=%02n:%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

" Keybindings
    map <C-N> :NERDTreeToggle<CR>

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

" Setting Tab Width
    set expandtab
    set smarttab
    set tabstop=4       " The width of a TAB is set to 4.
                        " Still it is a \t. It is just that
                        " Vim will interpret it to be having
                        " a width of 4.

    set shiftwidth=4    " Indents will have a width of 4 

    set softtabstop=4   " Sets the number of columns for a TAB

    set expandtab       " Expand TABs to spaces

" Syntastic
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0
    "let g:syntastic_check_on_w = 1
    let g:syntastic_auto_jump = 1

" Mouse behavior
    set mouse=a          " Lets me click around in VIM
