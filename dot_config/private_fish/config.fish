if status is-interactive
    # Commands to run in interactive sessions can go here
end

if status is-login
	# set path
	fish_add_path ~/bin
end

alias cm chezmoi
