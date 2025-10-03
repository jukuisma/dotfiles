if status is-interactive

    if bind --key-names | grep '^space$' > /dev/null 2>&1
        set NEW_KEYBINDS true
    else
        set NEW_KEYBINDS false
    end

    # Bind C-f to run tmux-sessionizer.
    # Clear terminal and repaint after exiting tmux to avoid buggy behavior.
    if $NEW_KEYBINDS
        bind ctrl-f "tmux-sessionizer && clear && commandline -f repaint"
    else
        bind \cf "tmux-sessionizer && clear && commandline -f repaint"
    end

    # Bind C-space to accept autosuggestions.
    if $NEW_KEYBINDS
        bind ctrl-space accept-autosuggestion
    else
        bind -k nul accept-autosuggestion
    end

end
