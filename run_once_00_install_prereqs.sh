#!/bin/bash

# Install brew
# SEE: https://github.com/Homebrew/install/#install-homebrew-on-macos-or-linux
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# rest of scripts rely on fish, so install that first
brew install fish

# set fish as default shell
# https://stackoverflow.com/questions/453236/how-can-i-set-my-default-shell-on-a-mac-e-g-to-fish
# https://www.cyberciti.biz/faq/sudo-append-data-text-to-file-on-linux-unix-macos/

# if fish is not already in the shells file
if ! grep -q fish /etc/shells; then
	echo "could not find fish in /etc/shells. Adding."
	echo /usr/local/bin/fish | sudo tee -a /etc/shells
fi

# set fish as main shell
if ! echo $SHELL | grep -q fish; then
    if ! command -v chsh &> /dev/null
    then
        echo "setting fish as primary shell"
        chsh -s /usr/local/bin/fish
    else
        echo "couldn't update primary shell to fish"
        echo "launching fish manually on each login"
        echo fish >> ~/.bashrc
    fi
fi

