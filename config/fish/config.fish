# Get rid of stupid greeting
set fish_greeting

# Navigation
function ..
    cd ..
end
function ...
    cd ../..
end
function ....
    cd ../../..
end
function .....
    cd ../../../..
end
function l
    tree --dirsfirst -aFCNL 1 $argv
end
function ll
    tree --dirsfirst -ChFupDaLg 1 $argv
end


# Utilities
function a
    command ag --ignore=.git --ignore=log --ignore=tags --ignore=tmp --ignore=vendor --ignore=spec/vcr $argv
end
function b
    bundle exec $argv
end
function c
    pygmentize -O style=monokai -f console256 -g $argv
end
function d
    du -h -d=1 $argv
end
function df
    command df -h $argv
end
function digga
    command dig +nocmd $argv[1] any +multiline +noall +answer
end
function f
    foreman run bundle exec $argv
end
function g
    git $argv
end
function grep
    command grep --color=auto $argv
end
function httpdump
    sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E "Host\: .*|GET \/.*"
end
function ip
    curl -s http://checkip.dyndns.com/ | sed 's/[^0-9\.]//g'
end
function localip
    ipconfig getifaddr en0
end
function lookbusy
    cat /dev/urandom | hexdump -C | grep --color "ca fe"
end
function mp
    nvim $argv
end
function tmux
    command tmux -2 $argv
end
function tunnel
    ssh -D 8080 -C -N $argv
end
function view
    nvim -R $argv
end
function vp
    nvim $argv
end
function streamaudio
    rygel
end
function loginpanther
    ssh danielbarbarito@panther.adelphi.edu
end
function commitm
    curl -s http://whatthecommit.com/index.txt
end
function linkpanther
    sshfs danielbarbarito@panther.adelphi.edu:/home/da21066/ ~/.panther
end
function loginvps
    ssh barbz@107.175.2.186
end
function linkvps
    sshfs barbz@107.175.2.186:/home/barbz ~/.vps
end
function cdd
    cd ~/.dotfiles
end
function cde
    cd ~/.dotfiles/emacs.d
end
function mm
    mpv --no-video --ytdl-format=bestaudio ytdl://ytsearch10:"$argv"
end

# Text
# function e        ; emacsclient -t -a "" $argv; end
# function emacs        ; emacsclient -t -a "" $argv; end


# Environment
set -x GOPATH "/Users/danbarbarito/.go:/Users/danbarbarito/Projects"
set -x ANDROID_HOME "/usr/local/Cellar/android-sdk/24.4.1_1"
set -x ALTERNATE_EDITOR "/usr/local/bin/micro"
set -x EDITOR "/usr/local/bin/micro"
set -x VISUAL_EDITOR "/usr/local/bin/micro"
set -x VISUAL "/usr/local/bin/micro"
set -x PERL_LWP_SSL_VERIFY_HOSTNAME 0
set -x ERL_AFLAGS "-kernel shell_history enabled"



# PATH
set -gx PATH ~/.bin ~/.local/bin/ $PATH
# set -gx PATH ~/.rakudobrew/bin $PATH

test -d "~/.composer/vendor/bing"; and set -gx PATH ~/.composer/vendor/bin $PATH
test -d "$ANDROID_HOME/tools"; and set -gx PATH $ANDROID_HOME/tools $PATH; and set -gx PATH $ANDROID_HOME/tools/bin $PATH
test -d "~/.pear"; and set -gx PATH ~/.pear/bin $PATH
test -d "~/.cask"; and set -gx PATH ~/.cask/bin $PATH; and set -gx PATH ~/.cargo/bin $PATH

# OS specific
switch (uname)
    case Darwin
end

# Completions
function make_completion --argument-names alias command
    echo "
  function __alias_completion_$alias
    set -l cmd (commandline -o)
    set -e cmd[1]
    complete -C\"$command \$cmd\"
  end
  " | .
    complete -c $alias -a "(__alias_completion_$alias)"
end

make_completion b 'bundle exec'
make_completion g 'git'

# rbenv
status --is-interactive
and . (rbenv init -|psub)

# perlbrew
# . ~/perl5/perlbrew/etc/perlbrew.fish

# virtualfish
# eval (python -m virtualfish)

test -e {$HOME}/.iterm2_shell_integration.fish
and source {$HOME}/.iterm2_shell_integration.fish
