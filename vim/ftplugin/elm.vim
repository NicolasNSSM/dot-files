augroup elmDoFormat
  autocmd!
  autocmd BufWritePost *.elm :mkview
  autocmd BufWritePost *.elm :silent! exe "silent !elm-format --yes %"
  autocmd BufWritePost *.elm :e %
  autocmd BufWritePost *.elm :loadview
augroup END
