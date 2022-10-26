alias cm chezmoi
alias vim nvim

alias dfish "cd $__fish_config_dir"
alias dcm "cd ~/.local/share/chezmoi/"
alias dnvim "cd ~/.config/nvim"

alias edit_fish "vim ~/.config/fish/config.fish"
alias edit_nvim "vim ~/.config/nvim/init.vim"

alias ls "exa --icons"
alias ll "exa -la --icons --git --header"

alias c clear

function bat -w bat
    set TERM screen-256color
    command bat $argv
end

set local_aliases $__fish_config_dir/aliases-local.fish
if test -f $local_aliases
  source $local_aliases
end
