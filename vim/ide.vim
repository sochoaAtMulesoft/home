set splitbelow
set splitright

set foldmethod=indent
set foldlevel=99
nnoremap <space> za
Plugin 'tmhedberg/SimpylFold'
let g:SimpylFold_docstring_preview=1

Plugin 'ycm-core/YouCompleteMe'
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_always_populate_location_list = 1 "default 0
let g:ycm_open_loclist_on_ycm_diags = 1 "default 1
set complete=.,w,b,u,t
let g:ycm_complete_in_strings = 1 "default 1
let g:ycm_collect_identifiers_from_tags_files = 0 "default 0
let g:ycm_path_to_python_interpreter = '/Users/bitcycle/.pyenv/shims/python' "default ''

map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

set cot=menu,menuone

ino <BS> <BS><C-r>=getline('.')[col('.')-3:col('.')-2]=~#'\k\k'?!pumvisible()?"\<lt>C-n>\<lt>C-p>":'':pumvisible()?"\<lt>C-y>":''<CR>
inoremap <expr> <CR>    pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

function! s:skinny_insert(char)
  if !pumvisible() && !exists('s:skinny_complete') &&
              \ getline('.')[col('.') - 2].a:char =~# '\k\k'
    let s:skinny_complete = 1
    noautocmd call feedkeys("\<C-n>\<C-p>", "nt")
  endif
endfunction

augroup SkinnyAutoComplete
  autocmd!
  autocmd InsertCharPre * call <SID>skinny_insert(v:char)
  autocmd CompleteDone * if exists('s:skinny_complete') | unlet s:skinny_complete | endif
augroup END


Plugin 'airblade/vim-gitgutter'

Plugin 'godlygeek/tabular'
vmap <Leader>t :Tabularize /
nmap <F8> :TagbarToggle<CR>

Plugin 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup = 1

Plugin 'haya14busa/incsearch.vim'
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" Golang
Plugin 'fatih/vim-go'

" Python
Plugin 'vim-scripts/indentpython.vim'
Plugin 'nvie/vim-flake8'
let g:flake8_show_in_gutter = 1

au BufNewFile,BufRead *.py
    \ set tabstop=4       |
    \ set softtabstop=4   |
    \ set shiftwidth=4    |
    \ set textwidth=180   |
    \ set expandtab       |
    \ set autoindent      |
    \ set fileformat=unix |
    \ let python_highlight_all = 1
