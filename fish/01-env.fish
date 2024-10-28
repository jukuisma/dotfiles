if status is-interactive
    fish_add_path ~/.local/bin/
    set -gx fish_escape_delay_ms 10
    set -gx EDITOR nvim
    set -gx KEEPASSXC_DB
    set -gx KEEPASSXC_KEY
    set -gx LIBVIRT_DEFAULT_URI qemu:///system
    set -gx VAGRANT_DEFAULT_PROVIDER libvirt
    set -gx XM5_UUID
end
