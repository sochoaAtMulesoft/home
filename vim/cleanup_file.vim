source ~/.vim/win_view.vim

function! Retab()

endfunction

function! CleanupEmptyLines()
  call SaveWinView()
  %s/\s\+$//e
  %!awk 'NF {p=1} p' | tac | awk 'NF {p=1} p' | tac
  call RestoreWinView()
endfunction

" All files
autocmd BufWritePre * call CleanupEmptyLines()
