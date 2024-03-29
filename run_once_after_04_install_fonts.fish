#!/usr/bin/env fish

function install_fira_nerd
    linfo installing fira nerd font

    # fonts are installed to different places depending on the os
    {{ if eq .chezmoi.os "darwin" }}
    set -l target_file ~/Library/fonts/Fira\ Code\ Regular\ Nerd\ Font\ Complete.ttf 
    {{ else }}
    mkdir -p ~/.local/share/fonts
    set -l target_file ~/.local/share/fonts/Fira\ Code\ Regular\ Nerd\ Font\ Complete.ttf 
    {{ end }}

    if not test -f $target_file
        wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/FiraCode.zip -O /tmp/FiraCode.zip
        unzip /tmp/FiraCode.zip -d /tmp/FiraCode
        cp /tmp/FiraCode/Fira\ Code\ Regular\ Nerd\ Font\ Complete.ttf $target_file
    end
end

function main
   install_fira_nerd
end

main
