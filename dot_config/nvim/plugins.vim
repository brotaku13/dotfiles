" fuzzy find
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" navigate between vim and tmux panes seamlessly
Plug 'christoomey/vim-tmux-navigator'

" auto insert parens
Plug 'jiangmiao/auto-pairs'

" airline status bar and themes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" smart commenting
Plug 'preservim/nerdcommenter'

" show git status of lines in gutter
Plug 'airblade/vim-gitgutter'

" themes
Plug 'drewtempelmeyer/palenight.vim'

" use <C-c> to yank to system clipboard in visual mode
Plug 'ojroques/vim-oscyank', {'branch': 'main'}

" proper syntax highlighting for fish + bonus colorschem
Plug 'nickeb96/fish.vim'

" code completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
