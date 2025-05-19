if status is-interactive

    fish_add_path ~/.local/bin/
    fish_add_path ~/.cargo/bin/

    set -gx fish_escape_delay_ms 10
    set -gx LESS -R
    set -gx PAGER less
    set -gx EDITOR nvim
    set -gx CLICOLOR 1 # tree
    set -gx KEEPASSXC_DB
    set -gx KEEPASSXC_KEY
    set -gx LIBVIRT_DEFAULT_URI qemu:///system
    set -gx VAGRANT_DEFAULT_PROVIDER libvirt
    set -gx XM5_UUID

    # Color man w/ bat
    set -gx MANPAGER "sh -c 'col -bx | bat -l man -p'"
    set -gx MANROFFOPT -c

    if grep nixos /etc/os-release > /dev/null 2>&1
        set -gx BIN /run/current-system/sw/bin
    else
        set -gx BIN /usr/bin
    end

    set -gx GREET_ZPOOL false

end
