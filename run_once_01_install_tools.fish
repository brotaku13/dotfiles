#!/usr/local/bin/fish

# installing oh my fish which is a themer for fish shell
# https://github.com/oh-my-fish/oh-my-fish
function install_fish
   linfo installing oh my fish
   if not test -d ~/.local/share/omf
      ldebug omf not found. getting omf from github
      curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
   else
      ldebug omf already installed!
   end
   ldebug updating plugins
   omf update
   linfo omf installed

   linfo installing fisher plugin manager
   if not type -q fisher
      ldebug fisher not found. getting from github
      curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fishe
   else
      ldebug fisher already installed
   end

   linfo fisher installed 
   fisher update
end

# installing tmux plugin manager
# https://github.com/tmux-plugins/tpm
function install_tpm
   linfo installing tmux plugin manager
   if not test -d ~/.tmux/plugins/tpm
      ldebug tpm not found. downloading from github
      git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
   else
      ldebug tpm already installed!
   end
   # can download and update all plugins via the command line
   # https://github.com/tmux-plugins/tpm/blob/master/docs/managing_plugins_via_cmd_line.md
   ldebug installing plugins
   ~/.tmux/plugins/tpm/bin/install_plugins
   ldebug updating plugins
   ~/.tmux/plugins/tpm/bin/update_plugins all
   linfo tpm installed
end

function install_rust
   linfo installing rust
   if not type -q cargo
      ldebug cargo not found, installing.
      curl https://sh.rustup.rs -sSf | sh
   else
      ldebug cargo already installed!
   end

   ldebug updating cargo
   rustup update
   linfo rust installed
end

# install nodejs which is a prereq of coc code completion in vim
function install_nodejs
   linfo installing node js
   curl -sL install-node.vercel.app/lts | bash
end

function main
   install_fish
   install_tpm
   install_rust
   install_nodejs
end

main
