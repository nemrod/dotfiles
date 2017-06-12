set nocompatible

set encoding=utf-8

set autoindent
set cindent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set noexpandtab
filetype plugin indent on

syntax on

cmap w!! w !sudo tee > /dev/null %

nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
nnoremap <silent> <C-l> :nohlsearch<CR><C-l>

set wrap
set linebreak
set formatoptions=qrn1

nnoremap j gj
nnoremap k gk

let mapleader = '-'

set wildmenu
set wildmode=list:longest,full

set backspace=indent,eol,start
set scrolloff=3
set visualbell
set ttyfast
set number
set ruler
set background=dark
set mouse=r
set modelines=0
set hidden

set laststatus=2

set updatetime=500

" Current directory follows the file being edited, unless it's a remote file
if exists(":lcd")
	autocmd BufEnter * if bufname("") !~ '^[[:alnum:]]*://' | silent! lcd %:p:h | endif
else
	autocmd BufEnter * if bufname("") !~ '^[[:alnum:]]*://' | cd %:p:h | endif
endif

if has('cscope')
	set cscopeverbose
	set cscopetag
	if filereadable('cscope.out')
		cs add cscope.out
	elseif $CSCOPE_DB != ''
		cs add $CSCOPE_DB
	endif

	nmap <Leader>cs :cs find s <C-R>=expand("<cword>")<CR><CR>
	nmap <Leader>cg :cs find g <C-R>=expand("<cword>")<CR><CR>
	nmap <Leader>cd :cs find d <C-R>=expand("<cword>")<CR><CR>
	nmap <Leader>cc :cs find c <C-R>=expand("<cword>")<CR><CR>
	nmap <Leader>ct :cs find t <C-R>=expand("<cword>")<CR><CR>
	nmap <Leader>ce :cs find e <C-R>=expand("<cword>")<CR><CR>
	nmap <Leader>cf :cs find f <C-R>=expand("<cfile>")<CR><CR>
	nmap <Leader>ci :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
	nmap <Leader>ca :cs find a <C-R>=expand("<cword>")<CR><CR>
endif

if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')
Plug 'chriskempson/base16-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'sirtaj/vim-openscad'
Plug 'airblade/vim-gitgutter'
Plug 'vim-syntastic/syntastic'
if filereadable(glob('~/.vimrc.localplugins'))
	source ~/.vimrc.localplugins
endif
call plug#end()

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height = 5

let g:airline#extensions#hunks#non_zero_only = 1

let g:ctrlp_show_hidden = 1
if executable('rg')
	let g:ctrlp_user_command = ['.git', 'cd %s; rg --files', 'find %s -type f']
endif

if filereadable(expand("~/.vimrc_background"))
	let base16colorspace = 256
	source ~/.vimrc_background
endif

if filereadable(glob('~/.vimrc.local'))
	source ~/.vimrc.local
endif
