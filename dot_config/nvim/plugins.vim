" themes
Plug 'drewtempelmeyer/palenight.vim'
Plug 'bluz71/vim-moonfly-colors'
Plug 'EdenEast/nightfox.nvim'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'rebelot/kanagawa.nvim'

" fuzzy find
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" fuzzy find 2.0
Plug 'nvim-lua/plenary.nvim' " required dependency
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }

" navigate between vim and tmux panes seamlessly
Plug 'christoomey/vim-tmux-navigator'

" auto insert parens
Plug 'jiangmiao/auto-pairs'

" airline status bar and themes
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'

" light line status bar
Plug 'itchyny/lightline.vim'
Plug 'josa42/vim-lightline-coc'

" colored icons
Plug 'kyazdani42/nvim-web-devicons' 
" bufferline
Plug 'akinsho/bufferline.nvim', { 'tag': 'v3.*' }

"" smart commenting
Plug 'preservim/nerdcommenter'

" show git status of lines in gutter
Plug 'airblade/vim-gitgutter'

" git blame info in status bar
Plug 'zivyangll/git-blame.vim'

" git integration.
Plug 'tpope/vim-fugitive'

" use <C-c> to yank to system clipboard in visual mode
Plug 'ojroques/vim-oscyank', {'branch': 'main'}

" proper syntax highlighting for fish + bonus colorschem
Plug 'nickeb96/fish.vim'

" code completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" rust stuff
Plug 'rust-lang/rust.vim'

" go development
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" surround with quotes etc
Plug 'tpope/vim-surround'

" vimwiki for taking notes: https://github.com/vimwiki/vimwiki
Plug 'vimwiki/vimwiki'
"
