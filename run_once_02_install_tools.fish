#!/usr/local/bin/fish

# installing oh my fish which is a themer for fish shell
# https://github.com/oh-my-fish/oh-my-fish
function install_fisher
   linfo installing fisher plugin manager
   if not type -q fisher
      ldebug fisher not found. getting from github
      curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
   else
      ldebug fisher already installed
   end

   linfo fisher installed 
   fisher update

   linfo make sure to run `tide configure` to configure the prompt!
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

function main
   install_fisher
   install_tpm
   install_rust
end

main
