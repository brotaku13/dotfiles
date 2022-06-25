function to_color -a color
   set_color $color
   echo $argv[2..] # array indices start at 1!
   set_color normal
end

function ldebug -d "debug level logs"
   to_color normal "[debg] $argv"
end

function linfo -d "info level logs"
   to_color green "[info] $argv"
end

function lwarning -d "warning level logs"
   to_color yellow "[WARN] $argv"
end

function lerror -d "error level logs"
   to_color red "[ERRO] $argv"
end
