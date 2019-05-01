set encoding=utf-8

set autoindent
set tabstop=2
set shiftwidth=2
set softtabstop=2
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
set showcmd
set background=dark
set nomodeline
set hidden
set display=truncate

set laststatus=2

set ttimeout
set ttimeoutlen=100
set updatetime=500

if !exists(":DiffOrig")
	command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
				\ | wincmd p | diffthis
endif

if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')
Plug 'danielwe/base16-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'mbbill/undotree'
Plug 'airblade/vim-rooter'
Plug 'w0rp/ale'
Plug 'tpope/vim-fugitive'
Plug 'edkolev/promptline.vim'
Plug 'edkolev/tmuxline.vim'
Plug 'tpope/vim-unimpaired'
if filereadable(glob('~/.vimrc.localplugins'))
	source ~/.vimrc.localplugins
endif
call plug#end()

nmap <Leader>ut :UndotreeToggle<CR>
if has("persistent_undo")
	silent !mkdir -p ~/.vim_undo >/dev/null 2>&1
	set undodir=~/.vim_undo/
	set undofile
endif

let g:airline#extensions#hunks#non_zero_only = 1
let g:airline_theme = 'badwolf'
let g:airline_powerline_fonts = 1

let g:ale_list_window_size = 5
nmap <silent> [e <Plug>(ale_previous_wrap)
nmap <silent> ]e <Plug>(ale_next_wrap)
let g:ale_open_list = 0

let g:rooter_patterns = ['.git/', '.git']
let g:rooter_change_directory_for_non_project_files = 'current'

let g:ctrlp_show_hidden = 1
let g:ctrlp_working_path_mode = 'rw'
if executable('rg')
	let g:ctrlp_user_command = 'rg --files'
endif

if filereadable(expand("~/.vimrc_background"))
	let base16colorspace = 256
	source ~/.vimrc_background
endif

if filereadable(glob('~/.vimrc.local'))
	source ~/.vimrc.local
endif
