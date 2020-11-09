let skip_defaults_vim=1                   " Don't use Vim defaults' settings
let mapleader=','                         " Use the comma as leader
let &colorcolumn=80                       " Display the column #80
set ttyfast                               " Send more characters to the screen for redrawing
set hidden                                " Allow switch beetween modified buffers
set number                                " Show line numbers.
set ignorecase                            " Case-insensitive searching.
set smartcase                             " But case-sensitive if expression contains a capital letter.
set expandtab                             " Converts tabs to spaces
set tabstop=4                             " Number of spaces a tab count for
set softtabstop=4                         " Number of spaces a tab count for when editing
set shiftwidth=4                          " Number of spaces an autoindent count for
set incsearch                             " Highlight matches as you type
set hlsearch                              " Highlight matches
set cursorcolumn                          " Highlight the column the cursor is in
set ttimeoutlen=0                         " Escape Insert Mode faster
set autoread                              " Auto reload current file if externally changed
set noswapfile                            " Use an SCM instead of swap files
set encoding=utf-8                        " Sets the character encoding
set fileencoding=utf-8                    " Sets the character encoding
set list                                  " Active list mode
set listchars=nbsp:¬,eol:↩,trail:…,tab:▸▸ " Strings to use in 'list' mode
set t_ut=                                 " Disable Background Color Erase (BCE)
set backupcopy=yes                        " Disable safe write

" Change gutter color in insert mode
autocmd InsertEnter * hi LineNr ctermfg=4 ctermbg=232
autocmd InsertLeave * hi LineNr ctermfg=59 ctermbg=232

"------------------ CTAGS MAPPING ------------------

au FileType php set tags=tags_php-src.tags,tags_php-vendor.tags
au FileType behat set tags=tags_gherkin.tags
au FileType javascript set tags=tags_js-lib.tags,tags_js-src.tags,tags_js-modules.tags
au FileType typescript set tags=tags_ts-lib.tags,tags_ts-typings.tags,tags_ts-modules.tags,tags_ts-src.tags
au FileType python set tags=tags_python.tags

"------------------ KEY MAPPING ------------------

" Unbind help on F1
:nmap <F1> <nop>

" Make CTRL+C trigger InsertLeave
inoremap <C-c> <Esc>

" Change panel focus with tab
nnoremap <tab> <c-w><c-w>

" Explore tags list for the word under the cursor
map tt g<C-]>
map TT <C-T>

" Show next matched string at the center of the screen
nnoremap n nzz
nnoremap N Nzz

" Do a grep search on the selected text
if executable('ag')
    vmap <leader>f y:Ack! -i "<C-r>""
    nmap <leader>f :Ack! -i "<C-r><C-w>"
else
    vmap <leader>f y:grep -r "<C-r>""
    nmap <leader>f :grep -r "<C-r><C-w>"
endif

" Navigate throught words and lines
nmap <C-h> b
nmap <C-j> 7j
nmap <C-k> 7k
nmap <C-l> w
vmap <C-h> b
vmap <C-j> 7j
vmap <C-k> 7k
vmap <C-l> w

" Quit buffer keeping the split
nnoremap <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>

" Fast split resize
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent> <Leader>> :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nnoremap <silent> <Leader>< :exe "vertical resize " . (winwidth(0) * 2/3)<CR>

" Make :grep great again
if executable('ag')
    set grepprg=ag\ --group
endif

"---------------- PLUGINS INSTALL ----------------

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'DataWraith/auto_mkdir'                                                             " Create dir tree on save if it doesnt exist
Plug 'Galooshi/vim-import-js'                                                            " JS library import helper
Plug 'airblade/vim-gitgutter'                                                            " Shows a git diff in the gutter
Plug 'arnaud-lb/vim-php-namespace'                                                       " Manage 'use' statements automatically.
Plug 'christoomey/vim-sort-motion'                                                       " Sort inline words
Plug 'editorconfig/editorconfig-vim'                                                     " Respect .editorconfig
Plug 'godlygeek/tabular'                                                                 " Text filtering and alignment
Plug 'itchyny/lightline.vim'                                                             " Light and configurable statusline/tabline
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }                        " Command-line fuzzy finder
Plug 'junegunn/fzf.vim'                                                                  " FZF support for vim
Plug 'maralla/completor.vim', { 'dir': '~/.vim/plugged/completor.vim', 'do': 'make js' } " Asynchronous code completion framework
Plug 'mileszs/ack.vim'                                                                   " Search tool
Plug 'nanotech/jellybeans.vim'                                                           " Colorscheme
Plug 'ntpeters/vim-better-whitespace'                                                    " Delete useless whitespaces
Plug 'reasonml-editor/vim-reason-plus'                                                   " ReasonML syntax
Plug 'scrooloose/nerdtree'                                                               " File system explorer
Plug 'sirver/ultisnips'                                                                  " Snippet solution
Plug 'sjbach/lusty'                                                                      " Manage files and buffers
Plug 'tpope/vim-eunuch'                                                                  " helpers for UNIX, eg: `:Rename` `:Delete`
Plug 'tpope/vim-fugitive'                                                                " Git wrappern eg: `:Gblame`, `:Gdiff`
Plug 'w0rp/ale'                                                                          " Asynchronous Lint Engine

call plug#end()

"---------------- PLUGINS CONFIGS ----------------

"
" nanotech/jellybeans
"
colorscheme jellybeans

"
" sjbach/lusty
"
let g:LustyJugglerShowKeys = 0
map <leader>lp :LustyJugglePrevious<cr>

"
" arnaud-lb/vim-php-namespace
"
let g:php_namespace_sort_after_insert = 1
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>
autocmd FileType php inoremap <Leader>e <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap <Leader>e :call PhpExpandClass()<CR>
autocmd FileType php inoremap <Leader>s <Esc>:call PhpSortUse()<CR>
autocmd FileType php noremap <Leader>s :call PhpSortUse()<CR>

"
" scrooloose/nerdtree
"
map <C-n> :NERDTreeToggle<CR>

"
" itchyny/lightline.vim
"
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'relativepath', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

"
" sirver/ultisnips
"
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsListSnippets = '<c-tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

"
" godlygeek/tabular
"
nmap <Leader>= :Tabularize /=<CR>
vmap <Leader>= :Tabularize /=<CR>
nmap <Leader>: :Tabularize /:\zs<CR>
vmap <Leader>: :Tabularize /:\zs<CR>
nmap <Leader>\| :Tabularize /\|<CR>
vmap <Leader>\| :Tabularize /\|<CR>
nmap <Leader>// :Tabularize ////<CR>
vmap <Leader>// :Tabularize ////<CR>

"
" mileszs/ack.vim
"
if executable('ag')
  let g:ackprg = 'ag --group --vimgrep'
endif

"
" junegunn/fzf.vim
"
set rtp+=~/.fzf
let g:fzf_colors = {
  \ 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment']
  \ }
nnoremap <C-p> :Files<CR>
nnoremap <leader>mr :History<CR>

"
" maralla/completor.vim
"
let g:completor_node_binary = '/usr/bin/node'

"
" ntpeters/vim-better-whitespace
"
autocmd BufEnter * EnableStripWhitespaceOnSave
let g:strip_whitespace_confirm=0

"
" w0rp/ale
"
nnoremap <leader>ale :ALEDetail<CR>
nnoremap <leader>esl :ALEFix eslint<CR>
highlight ALEWarningSign ctermfg=172
let g:ale_sign_warning = '>>'
let g:ale_completion_enabled = 1

let g:ale_linter_aliases = {'javascript': ['css', 'javascript'],'jsx': ['css', 'javascript']}

let g:ale_linters = {
\ 'javascript': ['stylelint', 'eslint'],
\ 'jsx': ['stylelint', 'eslint'],
\ 'vue': ['stylelint', 'eslint'],
\}

let g:ale_fixers = {
\ 'javascript': ['stylelint', 'eslint'],
\ 'jsx': ['stylelint', 'eslint'],
\ 'vue': ['stylelint', 'eslint'],
\ 'css': ['stylelint'],
\}

"
" editorconfig/editorconfig-vim
"
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

"
" christoomey/vim-sort-motion
"
let g:sort_motion_flags = "ui"
let g:sort_motion = '<leader>s'

"
" flowtype/vim-flow
"
let g:flow#enable = 0
