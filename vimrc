let mapleader=',' " Use the comma as leader
set hidden        " Allow switch beetween modified buffers
set number        " Show line numbers.
set ignorecase    " Case-insensitive searching.
set smartcase     " But case-sensitive if expression contains a capital letter.
set expandtab     " Converts tabs to spaces
set tabstop=4     " Number of spaces a tab count for
set softtabstop=4 " Number of spaces a tab count for when editing
set shiftwidth=4  " Number of spaces an autoindent count for
set incsearch     " Highlight matches as you type
set hlsearch      " Highlight matches
set cursorcolumn  " Highlight the column the cursor is in
set ttimeoutlen=0 " Escape Insert Mode faster

" Change gutter color in insert mode
autocmd InsertEnter * hi LineNr ctermfg=4 ctermbg=232
autocmd InsertLeave * hi LineNr ctermfg=59 ctermbg=232


"let mapleader=","               " Use the comma as leader
"
"" auto reload the config file after modifications
"autocmd BufWrite $MYVIMRC source $MYVIMRC
"
"set exrc
"set nocompatible                " Use vim defaults
"filetype on
"filetype indent on
"filetype plugin on
"syntax on
"
"set t_Co=256
"if &term =~ '256color'
"    " Disable Background Color Erase (BCE) so that color schemes
"    " work properly when Vim is used inside tmux and GNU screen.
"    set t_ut=
"endif
""set termguicolors
"autocmd InsertEnter * hi LineNr ctermfg=4 ctermbg=232
"autocmd InsertLeave * hi LineNr ctermfg=59 ctermbg=232
"let &colorcolumn=80
"
"set expandtab
"set tabstop=4
"set softtabstop=4
"set shiftwidth=4
"set autoindent
"set smartindent
"set list
"set listchars=nbsp:¬,eol:↩,trail:…,tab:▸▸
"set encoding=utf-8
"set fileencoding=utf-8
"set history=1000                " Increase history
"set nospell
"set showcmd                       " Display incomplete commands.
""set noshowmode                    " Don't display the mode you're in.
"set number                        " Show line numbers.
"set ruler                         " Show cursor position.
"set ignorecase                    " Case-insensitive searching.
"set smartcase                     " But case-sensitive if expression contains a capital letter.
"set incsearch                     " Highlight matches as you type.
"set hlsearch                      " Highlight matches.
"set showmatch                     " Show matching char (like {})
"set visualbell                    " No beeping.
"set nobackup                      " Don't make a backup before overwriting a file.
"set nowritebackup                 " And again.
"set noswapfile                    " Use an SCM instead of swap files
"" Highlight current line/column
"set cursorline
"set cursorcolumn
"set laststatus=2                   " Show the status line all the time
"set completeopt=menuone
"set pumheight=10
"set nofoldenable
"set scrolloff=5
"set sidescrolloff=5
"set hidden                          " Allow switch beetween modified buffers
"set backspace=indent,eol,start      " Improve backspacing
"set wildmenu                        " Better completion
"set wildmode=list:longest
"set wildignore=.git,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pyc
"set undolevels=1000                 " use many levels of undo
"set noundofile
"set autoread                        " Auto reload current file if externally changed
"set updatetime=250
"set timeoutlen=1000
"set ttimeoutlen=0
""execute 'highlight Visual cterm=reverse'

"------------------ CTAGS MAPPING ------------------

au FileType php set tags=tags_php-src.tags,tags_php-vendor.tags
au FileType behat set tags=tags_gherkin.tags
au FileType javascript set tags=tags_js-lib.tags,tags_js-src.tags,tags_js-modules.tags
au FileType typescript set tags=tags_ts-lib.tags,tags_ts-typings.tags,tags_ts-modules.tags,tags_ts-src.tags
au FileType python set tags=tags_python.tags

"------------------ KEY MAPPING ------------------

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
    vmap <leader>f y:Ack "<C-r>""
    nmap <leader>f :Ack "<C-r><C-w>"
else
    vmap <leader>f y:grep -r "<C-r>""
    nmap <leader>f :grep -r "<C-r><C-w>"
endif

" Navigate throught words and lines
nmap <C-h> b
nmap <C-j> 5j
nmap <C-k> 5k
nmap <C-l> w
vmap <C-h> b
vmap <C-j> 5j
vmap <C-k> 5k
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
    set grepprg=ag\ --nogroup\ --nocolor
endif

"---------------- PLUGINS INSTALL ----------------

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'arnaud-lb/vim-php-namespace'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'godlygeek/tabular'
Plug 'itchyny/lightline.vim'
Plug 'leafgarland/typescript-vim'
Plug 'mileszs/ack.vim'
Plug 'nanotech/jellybeans.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'scrooloose/nerdtree'
Plug 'sirver/ultisnips'
Plug 'sjbach/lusty'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'w0rp/ale'

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

"
" mileszs/ack.vim
"
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
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
