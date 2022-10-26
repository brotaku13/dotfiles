set -gx EDITOR nvim

# turn on vim bindings
fish_vi_key_bindings
bind -M insert -m default jj 'commandline -f repaint'

# set path
fish_add_path ~/bin

# sourcing all user scripts/libs
source $__fish_config_dir/aliases.fish
source $__fish_config_dir/logging.fish

# sourcing system configs
switch (uname)
   case Darwin
      set file $__fish_config_dir/config-osx.fish
      if test -f $file
         source $file
      end
   case Linux
      set file $__fish_config_dir/config-linux.fish
      if test -f $file
         source $file
      end
   case '*'
      echo "unkonwn system type"
end

# sourcing local config
set local_config $__fish_config_dir/config-local.fish
if test -f $local_config
  source $local_config
end

# theme configuration
set -gx SPACEFISH_CHAR_SYMBOL "λ"
set -gx SPACEFISH_VI_MODE_PREFIX ""
set -gx SPACEFISH_HOST_SHOW false
set -gx SPACEFISH_PACKAGE_SHOW false
set -gx SPACEFISH_RUST_SHOW false

