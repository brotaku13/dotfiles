#!/usr/local/bin/fish

function install_fira_nerd
    linfo installing fira nerd font
    if not test -f ~/Library/fonts/Fira\ Code\ Regular\ Nerd\ Font\ Complete.ttf
        wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/FiraCode.zip -O /tmp/FiraCode.zip
        unzip /tmp/FiraCode.zip -d /tmp/FiraCode
        cp /tmp/FiraCode/Fira\ Code\ Regular\ Nerd\ Font\ Complete.ttf ~/Library/fonts
    end
end

function main
   install_fira_nerd
end

main
