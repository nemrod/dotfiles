set nocompatible

set encoding=utf-8

set tabstop=4
set shiftwidth=4
set autoindent
set cindent
set noexpandtab
filetype plugin indent on

syntax on
" Pathogen?

set nofoldenable
set foldmethod=indent
set foldminlines=5
set foldlevel=1

nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
"set gdefault
set incsearch
set showmatch
set hlsearch
"nnoremap <tab> %
"vnoremap <tab> %

set wrap
set linebreak
set formatoptions=qrn1
"set colorcolumn=85

nnoremap j gj
nnoremap k gk

set wildmenu
set wildmode=list:longest,full

"set tags=tags;/

set backspace=indent,eol,start
set scrolloff=3
set showmode
set showcmd
set hidden
set visualbell
""set cursorline
set ttyfast
set number
set ruler
"set relativenumber
"set undofile
set background=light
set mouse=r
set modelines=0

set laststatus=2
set statusline=%F\ %y%m%=\ %{strlen(&fenc)?'['.&fenc.']':''}[%{&ff}]\ %c%V\ %l\,%L\ %P

" Some settings for :TOhtml
let g:html_use_css = 1
let g:html_use_xhtml = 1
let g:html_number_lines = 1

" Current directory follows the file being edited, unless it's a remote file
if exists(":lcd")
	autocmd BufEnter * if bufname("") !~ '^[[:alnum:]]*://' | silent! lcd %:p:h | endif
else
	autocmd BufEnter * if bufname("") !~ '^[[:alnum:]]*://' | cd %:p:h | endif
endif

" Replace HMTL åäö with the real ones
function Aao()
	:%s/&aring;\C/å/g
	:%s/&auml;\C/ä/g
	:%s/&ouml;\C/ö/g
	:%s/&Aring;\C/Å/g
	:%s/&Auml;\C/Ä/g
	:%s/&Ouml;\C/Ö/g
endfunction
