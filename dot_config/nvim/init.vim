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

" turns off error sounds
set noerrorbells

" sets tab size to 3
set tabstop=4 softtabstop=4

" expand tab to spaces
set expandtab
set shiftwidth=4

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
set colorcolumn=100
highlight ColorColumn ctermbg=0 guibg=lightgrey

" something to do with clipboard
set clipboard=unnamed

set termguicolors
" enable true color for terminal
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" map the leader key to space
let mapleader = " "

" map jj to exit key
imap jj <ESC>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" settings specific for filetype
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd Filetype go setlocal tabstop=4 shiftwidth=4 softtabstop=4 noexpandtab
autocmd FileType ruby setlocal shiftwidth=4 tabstop=4

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" custom remaps and commands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" automatically remove trailing white space on c, h, and py files
autocmd FileType rs,c,h,py autocmd BufWritePre <buffer> %s/\s\+$//e

" create new windows
nnoremap <leader>v :wincmd v<CR>
nnoremap <leader>s :wincmd s<CR>

" find replace of the word under the cursor
nnoremap <C-s> :%s/\<<C-r><C-w>\>/

" move lines up and down in any mode
" note that the special symbols are for mac since it has problems sending the
" alt
nnoremap <silent>∆ :m .+1<CR>==
nnoremap <silent>˚ :m .-2<CR>==

" place a blank line above or below cursor
nnoremap <leader>O :set paste<CR>m`O<Esc>``:set nopaste<CR>
nnoremap <leader>o :set paste<CR>m`o<Esc>``:set nopaste<CR>

" pane resize
noremap <leader>+ :resize +5<CR>
noremap <leader>- :resize -5<CR>
noremap <leader>< :vertical:resize -5<CR>
noremap <leader>> :vertical:resize +5<CR>

" buffer navigation with tab or shift+tab
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plugin customization
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  -----------------------------------------------------------------------------
"  VimWiki customization
"  -----------------------------------------------------------------------------
set nocompatible
filetype plugin on
syntax on

"  -----------------------------------------------------------------------------
"  NerdCommenter customization
"  -----------------------------------------------------------------------------

" nerd custom delimiter for C -> prefer // for single line comments
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
" let g:NERDCompactSexyComs = 1

" Set custom delimeters for C files. Unfortunately it looks like the multiline
" comments on leftAlt and rightAlt are not working
let g:NERDCustomDelimiters = {'c': { 'left': '//', 'leftAlt': '/**', 'rightAlt': '*/' }}

"  -----------------------------------------------------------------------------
"  FZF customization
"  -----------------------------------------------------------------------------

" " ctrl-p brings up file list
" nnoremap <C-p> <Esc><Esc>:Files<CR>

" " ctrl-g brings up ripgrep search
" nnoremap <C-g> :Rg<CR>

" " set the actions for while inside the search window
" let g:fzf_action = {
  " \ 'ctrl-t': 'tab split',
  " \ 'ctrl-s': 'split',
  " \ 'ctrl-v': 'vsplit'
  " \}

" " window layout
" let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }

" " change layout of fzf
" let $FZF_DEFAULT_OPS='--layout=reverse --info=inline'

"  -----------------------------------------------------------------------------
"  telescope configuration
"  -----------------------------------------------------------------------------
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>


"  -----------------------------------------------------------------------------
"  COC configuration
"  -----------------------------------------------------------------------------

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" install extensions automatically
let g:coc_global_extensions = ['coc-json', 'coc-git', 'coc-go', 'coc-rust-analyzer']

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> g[ <Plug>(coc-diagnostic-prev)
nmap <silent> g] <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Applying codeAction to the selected region.
" Example: `<leader>aw` for current word
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" set update time
set updatetime=300

" make cursor visible if leaving the references window with <C-c> instead of
" ESC 
let g:coc_disable_transparent_cursor = 1

"  -----------------------------------------------------------------------------
"  gitgutter configuration
"  -----------------------------------------------------------------------------
nnoremap <Leader>gn <Plug>(GitGutterNextHunk)
nnoremap <Leader>gp <Plug>(GitGutterPrevHunk)

"  -----------------------------------------------------------------------------
"  git blame configuration
"  -----------------------------------------------------------------------------
nnoremap <Leader>gb :<C-u>call gitblame#echo()<CR>

"  -----------------------------------------------------------------------------
"  Airline configuration
"  -----------------------------------------------------------------------------
" let g:airline#extensions#tabline#enabled = 1


"  -----------------------------------------------------------------------------
"  Airline configuration
"  -----------------------------------------------------------------------------
      " \ 'colorscheme': 'tokyonight',
let g:lightline = {
      \ 'colorscheme': 'darcula',
      \ 'enable': {
      \   'tabline': 0,
      \ },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \   'right': [[  'coc_info', 'coc_hints', 'coc_errors', 'coc_warnings', 'coc_ok' ], [ 'coc_status' ]]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \   'filename': 'LightlineTruncatedFileName',
      \ },
      \ }

" register compoments:
call lightline#coc#register()

function! LightlineTruncatedFileName()
let l:filePath = expand('%')
    if winwidth(0) > 100
        return l:filePath
    else
        return pathshorten(l:filePath)
    endif
endfunction


"  -----------------------------------------------------------------------------
"  Bufferline configuration https://github.com/akinsho/bufferline.nvim
"  -----------------------------------------------------------------------------
lua << EOF
require("bufferline").setup{}
EOF

" -----------------------------------------------------------------------------
"  Colorscheme configuration
" -----------------------------------------------------------------------------

"  -----------------------------------------------------------------------------
"  Palenight configuration
"  -----------------------------------------------------------------------------
let g:palenight_terminal_italics=1

" set the comment and gutter colors to the nice orange coloring
let g:palenight_color_overrides = {
\    'comment_grey':   { "gui": "#d1a159", "cterm": "59", "cterm16": "15" },
\    'gutter_fg_grey':   { "gui": "#d1a159", "cterm": "59", "cterm16": "15" },
\}
" colorscheme palenight

"  -----------------------------------------------------------------------------
"  Moonfly configuration
"  -----------------------------------------------------------------------------
" colorscheme moonfly

"  -----------------------------------------------------------------------------
"  Moonfly configuration
"  -----------------------------------------------------------------------------
" colorscheme carbonfox


"  -----------------------------------------------------------------------------
"  tokyo night configuration
"  -----------------------------------------------------------------------------
" colorscheme tokyonight-night

"  -----------------------------------------------------------------------------
"  kanagawa configuration
"  -----------------------------------------------------------------------------
colorscheme kanagawa


"  -----------------------------------------------------------------------------
"  OSCYank configuration
"  -----------------------------------------------------------------------------

" something changed with recent tmux version, so need to use this to
" workaround it
let g:oscyank_term = 'default'

" remap special yank to ctrl+c
vnoremap <C-c> :OSCYank<CR>


"  -----------------------------------------------------------------------------
"  vim-treesitter configuration
"  https://github.com/nvim-treesitter/nvim-treesitter
"  -----------------------------------------------------------------------------

" injecting lua script into vim config, see : https://www.reddit.com/r/neovim/comments/i5y18f/how_can_i_source_lua_from_initvim/
lua << EOF
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = "all",

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  ignore_install = {},

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = {},

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" custom scripts and functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
