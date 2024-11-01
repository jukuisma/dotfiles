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

    # Do not show vi mode on the prompt
    function fish_mode_prompt; end
    set -gx fish_key_bindings fish_vi_key_bindings

end
