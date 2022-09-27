set -gx EDITOR nvim

if status is-login
	# set path
   fish_add_path ~/bin
   fish_add_path ~/.cargo/bin
end

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

set local_config $__fish_config_dir/config-local.fish
if test -f $local_config
  source $local_config
end
