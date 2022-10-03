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
autocmd VimEnter * PlugUpdate && :q

" Change panel focus with tab
nnoremap <tab> <c-w><c-w>

" Do a grep search on the selected text
if executable('ag')
    vmap <leader>f y:Ack! -i "<C-r>""
    nmap <leader>f :Ack! -i "<C-r><C-w>"
else
    vmap <leader>f y:grep -r "<C-r>""
    nmap <leader>f :grep -r "<C-r><C-w>"
endif

" Show next matched string at the center of the screen
nnoremap n nzz
nnoremap N Nzz

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

" Make :grep great again
if executable('ag')
    set grepprg=ag\ --group
endif

let g:clipboard = {
  \   'name': 'xclip-xfce4-clipman',
  \   'copy': {
  \      '+': 'xclip -selection clipboard',
  \      '*': 'xclip -selection clipboard',
  \    },
  \   'paste': {
  \      '+': 'xclip -selection clipboard -o',
  \      '*': 'xclip -selection clipboard -o',
  \   },
  \   'cache_enabled': 1,
  \ }

" Insert current path
nnoremap <leader>path :put =expand('%:h')<CR>

call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-sort-motion'
Plug 'DataWraith/auto_mkdir'
Plug 'editorconfig/editorconfig-vim'
"Plug 'github/copilot.vim'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'nanotech/jellybeans.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ntpeters/vim-better-whitespace'
Plug 'scrooloose/nerdtree'
Plug 'sjbach/lusty'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
call plug#end()

" Declare CoC extensions
nnoremap <leader>l <Plug>(coc-codeaction)
nnoremap <silent><nowait> <leader>d  :<C-u>CocList diagnostics<cr>

autocmd ColorScheme * highlight CocErrorFloat ctermfg=209 guifg=White
"autocmd ColorScheme * highlight CocWarningFloat ctermfg=White guifg=White
autocmd ColorScheme * highlight CocFloating ctermbg=237 guibg=DarkGray
autocmd ColorScheme * highlight CocFloatDividingLine ctermbg=237 guibg=DarkGray

nmap <silent> gd <Plug>(coc-definition)

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-json',
  \ 'coc-html',
  \ 'coc-eslint',
  \ 'coc-styled-components',
  \ 'coc-stylelintplus',
  \ ]

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
" ntpeters/vim-better-whitespace
"
autocmd BufEnter * EnableStripWhitespaceOnSave
let g:strip_whitespace_confirm=0

"
" editorconfig/editorconfig-vim
"
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

"
" christoomey/vim-sort-motion
"
let g:sort_motion_flags = "ui"
let g:sort_motion = '<leader>s'
