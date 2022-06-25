#!/usr/bin/env fish

# a good git diff tool
# https://github.com/dandavison/delta
cargo install git-delta

# install rust language server
rustup component add rls rust-analysis rust-src
