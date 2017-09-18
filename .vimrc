" This file belongs in root folder

set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()
"" let Vundle manage Vundle

" Vundle Plugins

Plugin 'gmarik/Vundle.vim'                      
Plugin 'Syntastic'
Plugin 'Supertab'
Plugin 'flazz/vim-colorschemes'
Plugin 'scrooloose/nerdtree'
Plugin 'chriskempson/base16-vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Raimondi/delimitMate'
Plugin 'Yggdroot/indentLine'

call vundle#end() 	        	" required
filetype plugin indent on       " required

" UI
set number
syntax enable
set t_Co=256
colorscheme base16-google-dark 
hi Normal guibg=NONE ctermbg=NONE
highlight LineNr ctermfg=grey ctermbg=black
set laststatus=2 statusline=%02n:%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

    " 80 character limit
        match ErrorMsg '\%>80v.\+' 

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
    
    " Disable arrow keys
        nnoremap <Left> :echo "No left for you!"<CR>
        nnoremap <Right> :echo "No right for you!"<CR>
        nnoremap <Up> :echo "No up for you!"<CR>
        nnoremap <Down> :echo "No down for you!"<CR>

    " Syntastic
        nnoremap <Leader>sr :SyntasticReset<CR>
        nnoremap <Leader>sc :SyntasticCheck<CR>


    " Fix backspace issue
    set backspace=2  "compatible with version 5.4 and earlier
    
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
    let g:syntastic_check_on_open = 0
    let g:syntastic_check_on_wq = 0
    let g:syntastic_check_on_w = 0
    let g:syntastic_auto_jump = 1

" Mouse behavior
    set mouse=a          " Lets me click around in VIM

" UltiSnip Config
    let g:UltiSnipsExpandTrigger="<tab>"
    let g:UltiSnipsJumpForwardTrigger="<c-b>"
    let g:UltiSnipsJumpBackwardTrigger="<c-z>"

