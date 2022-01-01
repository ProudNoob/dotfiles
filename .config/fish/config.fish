if status is-interactive
    # Commands to run in interactive sessions can go here
end

# set -gx TERMINAL alacritty

set -x EDITOR nvim
set -x TERM xterm-256color
set -x PATH $PATH $GOPATH/bin $DENO_INSTALL/bin $HOME/.local/bin
set -x FZF_DEFAULT_OPTS '--prompt="הּ " --preview "bat --color=always {1} --theme=ansi" --layout=reverse --height=50% --info=inline --border --margin=1 --padding=1'


function update -d "Update everything"
    sudo -b pacman -Syu
    yay
    cowsay -f dragon-and-cow Upgrade Completed | lolcat
end

function l
    ls -la --color $argv
end

function fucking
    fuck --yeah
end

function ping
    prettyping $argv
end

function cov
    curl -L https://covid19-cli.wareneutron.com/history/charts/vietnam
end

function vi -d 'vim alias for nvim'
    lvim $argv
end

function vim -d 'vim alias for nvim'
    lvim $argv
end

function weather
    curl http://wttr.in/
end

# abbr yay="paru"
function yay -d 'yayification' --wrap "paru"
    paru $argv
end

function php
    /usr/bin/php74 $argv
end

function clear
    command clear && printf "\e[3J"
end

function reload
    exec fish
end

function pkglist
    pacman -Qq | fzf --preview 'pacman -Qil {}' --layout=reverse --bind 'enter:execute(pacman -Qil {} | less)'
end

function raspberrypi
    ssh -p 22  pi@raspberrypi.local
end

function logging
    sudo journalctl -xef
end

function vpn
    sudo openvpn --config ~/Documents/tasvpn3.trianh.vn-tai.nguyen.ovpn --auth-user-pass --auth-retry interact
end

function pic
    find /home/proudnoob/ntfs/Pics -type f | shuf -n1 | xargs -d '\n' catimg
end

function config -d 'dotfiles manager' --wrap "/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
    /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $argv
end

function x
    exa -la --icons
end

function wall
    feh --bg-max --no-fehbg --randomize ~/ntfs/Pics/*
end

thefuck --alias | source

starship init fish | source

~/Packages/term-theme/bin/theme.sh monokai
