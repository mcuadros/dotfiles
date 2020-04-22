set -gx GOPATH "/home/mcuadros/workspace/go"
set -gx PATH $GOPATH/bin/ $PATH
set -gx PATH /snap/bin/ $PATH
set -gx PATH /var/lib/snapd/snap/bin $PATH
set -gx PATH $HOME/.yarn/bin/ $PATH
set -gx PATH $HOME/.cabal/bin $PATH
set -gx PATH $HOME/.ghcup/bin $PATH
set -gx PATH /opt/gradle/gradle-6.0.1/bin $PATH
set -gx CLOUDSDK_PYTHON /usr/bin/python2
set -gx EDITOR /usr/bin/vim
set -gx BROWSER /usr/bin/brave
set -gx PATH /home/mcuadros/.nvm/versions/node/v10.17.0/bin/ $PATH
set -x GPG_TTY (tty)
set -gx GOPRIVATE gitlab.com/5959

# requires https://github.com/tuvistavie/fundle
fundle plugin 'edc/bass'
fundle plugin 'tuvistavie/fish-ssh-agent'
fundle init

alias kall='kubectl get all'
alias k='kubectl'
alias lock='.config/i3/lock.sh'
alias battle='wine "./.wine/drive_c/Program Files (x86)/Blizzard App/Battle.net.8733/Battle.net.exe"'

setxkbmap us -variant altgr-intl


alias config='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
