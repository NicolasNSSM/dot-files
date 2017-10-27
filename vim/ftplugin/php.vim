map <leader>sp :execute ":! phpspec run ".@%." -fpretty -vvv --stop-on-failure"<CR>
map <leader>pl :execute ":! php -l ".@%<CR>
set keywordprg=pman
