
" install vim plugged if this is the first time using it
" https://github.com/junegunn/vim-plug
" https://github.com/junegunn/vim-plug/issues/675
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" load in the plugins from a plugin file
let plugin_file = stdpath('config') . '/plugins.vim'
if filereadable(plugin_file)
    call plug#begin()
    execute 'source' plugin_file
    call plug#end()
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" neovim general configuration
syntax on

" turns off error sounds
set noerrorbells

" sets tab size to 3
set tabstop=3 softtabstop=3

" expand tab to spaces
set expandtab
set shiftwidth=3

" smart indenting when possible
set smartindent

" turns on relative line numbers
set nu
set relativenumber

" turns off line wrapping
set nowrap

" if search is all lowercase, then ignore case until upper case letter is
" found
set smartcase

" don't create swap files
set noswapfile

" don't create backup files
set nobackup

" custom undo directory
set undofile
set undodir=~/.config/nvim/undodir

" use incremental search
set incsearch

" ignore case during search
set ignorecase

" turns mouse always on
set mouse=a

" designate split directions
set splitright
set splitbelow

" sets a colorcolumn at 80 characters
set colorcolumn=120
highlight ColorColumn ctermbg=0 guibg=lightgrey

" something to do with clipboard
set clipboard=unnamed

" enable true colors if possible
if (has("termguicolors"))
   set termguicolors
endif

" enable true color for terminal
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" map the leader key to space
let mapleader = " "

" map jj to exit key
imap jj <ESC>



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" custom remaps and commands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" automatically remove trailing white space on c, h, and py files
autocmd FileType c,h,py autocmd BufWritePre <buffer> %s/\s\+$//e

" automatically set config for python files
autocmd FileType py setlocal shiftwidth=3 softtabstop=3 expandtab

" create new windows
nnoremap <leader>v :wincmd v<CR>
nnoremap <leader>s :wincmd s<CR>

" terminal navigation
nnoremap <leader>t :split<CR>:res 10<CR>:terminal<CR>
nnoremap <ESC> <C-\><C-n> <CR>

" find replace of the word under the cursor
nnoremap <leader>s :%s/\<<C-r><C-w>\>/

"" move lines up and down in any mode
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" place a blank line above or below cursor
nnoremap <silent><S-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><S-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>

" pane resize
noremap <leader>+ :resize +5<CR>
noremap <leader>- :resize -5<CR>
noremap <leader>< :vertical:resize -5<CR>
noremap <leader>> :vertical:resize +5<CR>

" buffer navigation with tab or shift+tab
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

" toggles relative line numbers on all tabs
nnoremap <leader>n :tabdo windo set rnu<CR>
nnoremap <leader>N :tabdo windo set nornu<CR>



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plugin customization
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"  -----------------------------------------------------------------------------
"  NerdCommenter customization
"  -----------------------------------------------------------------------------

" nerd custom delimiter for C -> prefer // for single line comments
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Set custom delimeters for C files. Unfortunately it looks like the multiline
" comments on leftAlt and rightAlt are not working
let g:NERDCustomDelimiters = {'c': { 'left': '//', 'leftAlt': '/**', 'rightAlt': '*/' }}

"  -----------------------------------------------------------------------------
"  FZF customization
"  -----------------------------------------------------------------------------

" ctrl-p brings up file list
nnoremap <C-p> <Esc><Esc>:Files<CR>

" ctrl-f pretty searches in current file
nnoremap <C-f> <Esc><Esc>:BLines<CR>

" ctrl-g brings up ripgrep search
nnoremap <C-g> :Rg<CR>

" ctrl-b searches buffers
nnoremap <C-b> :Buffers<CR>

" set the actions for while inside the search window
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}

" window layout
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }

" change layout of fzf
let $FZF_DEFAULT_OPS='--layout=reverse --info=inline'

"  -----------------------------------------------------------------------------
"  COC configuration
"  -----------------------------------------------------------------------------

" install extensions automatically
let g:coc_global_extensions = ['coc-json', 'coc-git', 'coc-rls']

" tab completion
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"  -----------------------------------------------------------------------------
"  Airline configuration
"  -----------------------------------------------------------------------------

" tabline enabled
let g:airline#extensions#tabline#enabled = 1

" set theme
let g:airline_theme='deus'

"  -----------------------------------------------------------------------------
"  Palenight configuration
"  -----------------------------------------------------------------------------

let g:palenight_terminal_italics=1
set background=dark

" set the comment and gutter colors to the nice orange coloring
let g:palenight_color_overrides = {
\    'comment_grey':   { "gui": "#d1a159", "cterm": "59", "cterm16": "15" },
\    'gutter_fg_grey':   { "gui": "#d1a159", "cterm": "59", "cterm16": "15" },
\}
colorscheme palenight

"  -----------------------------------------------------------------------------
"  OSCYank configuration
"  -----------------------------------------------------------------------------

" remap special yank to ctrl+c
vnoremap <C-c> :OSCYank<CR>



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" custom scripts and functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" inserts the date while in insert mode
func! DateTag()
    return strftime("*** %Y-%m-%d (%A, %B %e, %Y)\r****")
endfunc
iabbr <expr> dateme DateTag()

" inserts the fixme string while in insert mode
func! FixMeTag()
    return "FIXME: [bcaulfield ".strftime("%Y-%m-%d")."]"
endfunc
iabbr <expr> fixme FixMeTag()
