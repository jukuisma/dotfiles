# Oh My Zsh setup
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="gnzh"
plugins=( git vi-mode )
source $ZSH/oh-my-zsh.sh

# Env variables
export EDITOR='vim'
export VAGRANT_DEFAULT_PROVIDER='libvirt'
export KEEPASSXC_DB=''
export KEEPASSXC_KEY=''
export XM3_UUID=''
export XM5_UUID=''

# Aliases
alias c="clear"
alias clipnt="wl-copy -c"
alias xclipnt="xclip -selection clipboard -i /dev/null"
alias connect-xm3="bluetoothctl connect $XM3_UUID"
alias disconnect-xm3="bluetoothctl disconnect $XM3_UUID"
alias connect-xm5="bluetoothctl connect $XM5_UUID"
alias disconnect-xm5="bluetoothctl disconnect $XM5_UUID"

function vault () {
    entry="$1"
    keepassxc-cli clip -k $KEEPASSXC_KEY $KEEPASSXC_DB $entry 0
}

function replace () {
    search="$1"
    replace="$2"

    for file in $(grep -rlI "$search"); do
        vim -c "%s/$search/$replace/gc" -c 'wq' "$file"
    done
}
