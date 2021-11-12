source ~/.vim/defaults.vim
source ~/.vim/reload_vimrc.vim
source ~/.vim/movement.vim
source ~/.vim/cleanup_file.vim " Updates BufWritePre

" Loading+Managing Plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

source ~/.vim/ide.vim " has plugins, so sourcing it here

Plugin 'vim-scripts/Rename2'
Plugin 'itchyny/lightline.vim'
Plugin 'flazz/vim-colorschemes'

Plugin 'scrooloose/nerdtree'
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
map <F5> :NERDTreeToggle<CR>

Plugin 'junegunn/fzf.vim'
let g:fzf_preview_window = 'right:50%'
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6  }  }
map <leader>o  :Files<CR>


Plugin 'scrooloose/syntastic'
Plugin 'majutsushi/tagbar'

call vundle#end()            " required
let python_highlight_all=1
filetype plugin indent on    " required
filetype on                  " required
syntax on

" Automatically exit insert mode
au InsertEnter * let updaterestore=&updatetime | set updatetime=4000
au InsertLeave * let &updatetime=updaterestore
au CursorHold,CursorHoldI * stopinsert

highlight Search cterm=NONE ctermfg=black ctermbg=yellow guibg=yellow guifg=black
set ts=2 sw=2 et

" Visual Adjustments
highlight Pmenu ctermbg=59 ctermfg=16
set laststatus=2
colorscheme jellybeans
