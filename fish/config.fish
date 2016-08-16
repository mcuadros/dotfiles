set fish_function_path $fish_function_path "/usr/lib/python2.7/site-packages/powerline/bindings/fish"
powerline-setup

set -gx GOPATH "/home/mcuadros/workspace/go"
set -gx PATH $GOPATH/bin/ $PATH
set -gx CLOUDSDK_PYTHON /usr/bin/python2
set -gx EDITOR /usr/bin/vim
set -gx BROWSER /usr/bin/google-chrome-stable

fundle plugin 'edc/bass'
fundle plugin 'tuvistavie/fish-fastdir'
fundle plugin 'tuvistavie/fish-ssh-agent'
fundle init

bass source '/home/mcuadros/.google-cloud-sdk/path.bash.inc'
bass source '/home/mcuadros/.google-cloud-sdk/completion.bash.inc'
