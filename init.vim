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
    call dein#add('chrisbra/matchit')
    call dein#add('chriskempson/base16-vim')
    call dein#add('morhetz/gruvbox')
	call dein#add('ctrlpvim/ctrlp.vim')
	call dein#add('scrooloose/nerdtree', { 'on_cmd': 'NERDTreeToggle' })
	call dein#add('scrooloose/nerdcommenter')
	call dein#add('Raimondi/delimitMate')
	"call dein#add('vim-scripts/Supertab')
	call dein#add('w0rp/ale')
	call dein#add('sirver/UltiSnips')
	call dein#add('Shougo/deoplete.nvim')
    call dein#add('Yggdroot/indentLine')
    call dein#add('honza/vim-snippets')
    call dein#add('Shougo/deoplete.nvim')
    if !has('nvim')
      call dein#add('roxma/nvim-yarp')
      call dein#add('roxma/vim-hug-neovim-rpc')
    endif
	call dein#end()
	if dein#check_install()
	  call dein#install()
	endif

	filetype plugin indent on

" Behavior

    colorscheme base16-default-dark
	syntax enable
	set mouse=a
	set number
    filetype plugin on

    set background=dark
    colorscheme gruvbox
    hi vertsplit ctermfg=238 ctermbg=235
    hi LineNr ctermfg=237
    hi StatusLine ctermfg=235 ctermbg=245
    hi StatusLineNC ctermfg=235 ctermbg=237
    hi Search ctermbg=58 ctermfg=15
    hi Default ctermfg=1
    hi clear SignColumn
    hi SignColumn ctermbg=235
    hi GitGutterAdd ctermbg=235 ctermfg=245
    hi GitGutterChange ctermbg=235 ctermfg=245
    hi GitGutterDelete ctermbg=235 ctermfg=245
    hi GitGutterChangeDelete ctermbg=235 ctermfg=245
    hi EndOfBuffer ctermfg=237 ctermbg=235

    set statusline=%=&P\ %f\ %m
    set fillchars=vert:\ ,stl:\ ,stlnc:\ 
    set laststatus=2
    set noshowmode

    " Ultisnips
    let g:UltiSnipsSnippetDirectories=["~/.config/Ultisnips"]

	let g:vimfiler_ignore_pattern = ''
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

        " Fix backspace issue
    		set backspace=2
    
        " Setting Tab Width
        	set expandtab
	        set smarttab
	        set tabstop=4 
    		set shiftwidth=4
	    	set softtabstop=4
	    	set expandtab

" Keybinds

    " NerdTree
    map <C-N> :NERDTreeToggle<CR>
    " Ultisnips
    let g:UltiSnipsExpandTrigger="<tab>"
    let g:UltiSnipsJumpForwardTrigger="<c-j>"
    let g:UltiSnipsJumpBackwardTrigger="<c-k>"
    " deoplete
    "let g:deoplete#enable_at_startup = 1

    " Personal keybindings
    inoremap <Space><Tab> <Esc>/(<>)<Enter>v3ldi
	vnoremap <Space><Tab> <Esc>/(<>)<Enter>v3ldi
    map <Space><Tab> <Esc>/(<>)<Enter>v3ldi
