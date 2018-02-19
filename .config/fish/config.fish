set -gx GOPATH "/home/mcuadros/workspace/go"
set -gx PATH $GOPATH/bin/ $PATH
set -gx CLOUDSDK_PYTHON /usr/bin/python2
set -gx EDITOR /usr/bin/vim
set -gx BROWSER /usr/bin/google-chrome-stable
set -gx QT_AUTO_SCREEN_SCALE_FACTOR 1.5 
set -gx PATH $HOME/.config/yarn/global/node_modules/.bin/  $PATH
set -x GPG_TTY (tty)

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

set -gx ONLINE_TOKEN d9130bbca4b37d58aa8767fa78ddf46fa926c8ad
set -gx OCTOPRINT_HOST http://10.3.167.147/
set -gx OCTOPRINT_APIKEY DE3E488D96C44AB182FF8608223784F9   
