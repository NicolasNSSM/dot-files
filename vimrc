au FileType php set tags=tags_php-src.tags,tags_php-vendor.tags
au FileType behat set tags=tags_gherkin.tags
au FileType javascript set tags=tags_js-lib.tags,tags_js-src.tags,tags_js-modules.tags
au FileType typescript set tags=tags_ts-lib.tags,tags_ts-typings.tags,tags_ts-modules.tags,tags_ts-src.tags
au FileType python set tags=tags_python.tags

let mapleader=","               " Use the comma as leader

" auto reload the config file after modifications
autocmd BufWrite $MYVIMRC source $MYVIMRC

set exrc
set nocompatible                " Use vim defaults
filetype on
filetype indent on
filetype plugin on
syntax on

set t_Co=256
"set termguicolors
colorscheme jellybeans
let g:jellybeans_use_lowcolor_black = 0

set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set smartindent
set list
set listchars=nbsp:¬,eol:↩,trail:…,tab:▸▸
set encoding=utf-8
set fileencoding=utf-8
set history=1000                " Increase history
set nospell
set showcmd                       " Display incomplete commands.
"set noshowmode                    " Don't display the mode you're in.
set number                        " Show line numbers.
set ruler                         " Show cursor position.
set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.
set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.
set showmatch                     " Show matching char (like {})
set visualbell                    " No beeping.
set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set noswapfile                    " Use an SCM instead of swap files
" Highlight current line/column
set cursorline
set cursorcolumn
set laststatus=2                   " Show the status line all the time
set completeopt=menuone
set pumheight=10
set nofoldenable
set scrolloff=5
set sidescrolloff=5
set hidden                          " Allow switch beetween modified buffers
set backspace=indent,eol,start      " Improve backspacing
set wildmenu                        " Better completion
set wildmode=list:longest
set wildignore=.git,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pyc
set undolevels=1000                 " use many levels of undo
set noundofile
set autoread                        " Auto reload current file if externally changed
set updatetime=250
"execute 'highlight Visual cterm=reverse'

nnoremap <tab> <c-w><c-w>

" Explore tags list for the word under the cursor
map tt g<C-]>
map TT <C-T>

" Navigate throught words and lines
nmap <C-h> b
nmap <C-left> b
nmap <C-j> 5j
nmap <C-down> 5j
nmap <C-k> 5k
nmap <C-up> 5k
nmap <C-l> w
nmap <C-right> w
vmap <C-h> b
vmap <C-left> b
vmap <C-j> 5j
vmap <C-down> 5j
vmap <C-k> 5k
vmap <C-up> 5k
vmap <C-l> w
vmap <C-right> w
"
" Lusty
"
map <leader>lp :LustyJugglePrevious<cr>
let g:LustyJugglerShowKeys = 0

"
" PHP Namespace
"
let g:php_namespace_sort_after_insert = 1

function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>
function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>e <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap <Leader>e :call PhpExpandClass()<CR>
autocmd FileType php inoremap <Leader>s <Esc>:call PhpSortUse()<CR>
autocmd FileType php noremap <Leader>s :call PhpSortUse()<CR>
let g:php_namespace_sort_after_insert = 1

"
" NERDTree
"
map <C-n> :NERDTreeToggle<CR>

"
" LightLine
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
" UltiSnips
"
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsListSnippets = '<c-tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

"
" Syntastic
"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_php_checkers = ['php']

"
" Tabularize
"
nmap <Leader>= :Tabularize /=<CR>
vmap <Leader>= :Tabularize /=<CR>
nmap <Leader>: :Tabularize /:\zs<CR>
vmap <Leader>: :Tabularize /:\zs<CR>
nmap <Leader>\| :Tabularize /\|<CR>
vmap <Leader>\| :Tabularize /\|<CR>

"
" CtrlP
"
let g:ctrlp_working_path_mode = 0
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
" speep up Ctrl-P
if executable('ag')
  if filereadable('.agignore')
      let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  else
      let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  endif
let g:ctrlp_use_caching = 0
endif

"
" Tagbar
"
nmap <F8> :TagbarToggle<CR>

"
" Ack
"
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
