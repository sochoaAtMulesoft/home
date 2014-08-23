set nocompatible
set tabstop=2
set shiftwidth=2
set expandtab
set nu

filetype plugin on
filetype plugin indent on 
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype python setlocal ts=4 sts=4 sw=4

" Search settings
set ignorecase      "for pattern matching
set smartcase       "if I use uppercase, match case sensitive
set incsearch       "show us matches immediately

" Code recognition
syntax on

" Misc stuff
set noswapfile
set nobackup

set foldmethod=indent
set foldlevel=2
set foldnestmax=2
inoremap <F10> <C-O>za
nnoremap <F10> za
onoremap <F10> <C-C>za
vnoremap <F10> zf
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf
au BufWinLeave ?* mkview 1
au BufWinEnter ?* silent loadview 1

set showcmd                     "show commands in status line
set confirm                     "Prompt on errors
set title                       "Let VIM manage the term title
set titlestring=%t\ %y\ %r\ %m  "Set a useful term title
set encoding=utf-8              "Use UTF-8 as standard encoding
set backspace=indent,eol,start  "Make backspace more flexible
set ruler                       "Always show current positions along the bottom
set formatoptions=torc          "Do some neat comment stuff for us
set whichwrap+=<,>
set hid
set ruler
set backspace=eol,start,indent
set magic
set noerrorbells
set novisualbell
set nowb
set wildmenu
set cmdheight=1
set report=0 " tell us when anything is changed via :...
set showmatch
set incsearch
set showcmd
set ttymouse=xterm
set pastetoggle=<F6>

let mapleader = ","

nmap <Leader>e :e ~/.vimrc<cr>
nmap <Leader>p\| :vsp<cr>
nmap <Leader>p_ :sp<cr>
nmap <Leader>s :update<cr>
nmap <F9> :TagbarToggle<CR> 
nmap <Leader>b :CtrlPBuffer<CR>
nmap <Leader>m :CtrlPMixed<CR>
nmap <Leader>o :CtrlP<CR>


let g:tagbar_width = 60
let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 1
vmap <Leader>t :Tabularize /

nnoremap <Leader>q @q
nmap <F5> :! !<cr>

inoremap <Leader>s <Esc>:w<cr>
inoremap JJ <Esc>
inoremap Jj <Esc>
inoremap jj <Esc>
inoremap jk <Esc>
imap <ESC> <NOP>
map <silent> <cr> :noh<cr>
autocmd! bufwritepost .vimrc source ~/.vimrc

" Navigation Changes
noremap l h
noremap ; l
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Line wrapping
nnoremap j gj
nnoremap k gk

filetype plugin on

set switchbuf+=useopen

" ==============================
" Automatically exit insert mode
"
au InsertEnter * let updaterestore=&updatetime | set updatetime=4000
au InsertLeave * let &updatetime=updaterestore
au CursorHoldI * stopinsert

if !has("gui_running") | let g:skip_loading_mswin = 1 | endif

" ===========================
" Required for Vundle to work 
" properly
"
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" ===================
" Vundle plugins list

set encoding=utf-8
Bundle 'tpope/vim-cucumber'
Bundle 'scrooloose/syntastic'
Bundle 'godlygeek/tabular'
Bundle 'ldx/vim-indentfinder'
Bundle 'majutsushi/tagbar'
Bundle 'Valloric/YouCompleteMe'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-git'
" Bundle 'suxpert/vimcaps'
Bundle 'kien/ctrlp.vim'
Bundle 'vim-scripts/Conque-Shell'

" Always show statusline
set laststatus=2

colorscheme railscasts

set hls
highlight Search cterm=NONE ctermfg=black ctermbg=yellow guibg=yellow guifg=black


au BufNewFile,BufRead *.feature set filetype=cucumber


set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]


" Gray background with black foreground
highlight Pmenu ctermbg=59 ctermfg=16


