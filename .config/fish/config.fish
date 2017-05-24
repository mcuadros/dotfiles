set -gx GOPATH "/home/mcuadros/workspace/go"
set -gx PATH $GOPATH/bin/ $PATH
set -gx CLOUDSDK_PYTHON /usr/bin/python2
set -gx EDITOR /usr/bin/vim
set -gx BROWSER /usr/bin/google-chrome-stable


set -gx PATH $HOME/.cargo/bin $PATH

# requires https://github.com/tuvistavie/fundle
fundle plugin 'edc/bass'
fundle plugin 'tuvistavie/fish-ssh-agent'
fundle init

bass source '/opt/google-cloud-sdk/path.bash.inc'
bass source '/opt/google-cloud-sdk/completion.bash.inc'

alias ical='gcalcli --calendar maximo@sourced.tech agenda'
alias lock='.config/i3/lock.sh'
alias battle='wine "./.wine/drive_c/Program Files (x86)/Blizzard App/Battle.net.8733/Battle.net.exe"'

alias config='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
