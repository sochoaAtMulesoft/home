function! CleanupEmptyLines()
  %!awk 'NF {p=1} p' | tac | awk 'NF {p=1} p' | tac
endfunction

" All files
autocmd BufWritePre * call CleanupEmptyLines()
