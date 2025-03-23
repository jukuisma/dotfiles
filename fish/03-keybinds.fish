if status is-interactive

    # Bind C-f to run tmux-sessionizer in both normal and insert modes.
    # Clear terminal and repaint after exiting tmux to avoid buggy behavior.
    bind \cf "tmux-sessionizer; clear; commandline -f repaint"

    # Bind C-y and C-space to accept autosuggestions.
    bind \cy accept-autosuggestion
    bind -k nul accept-autosuggestion

    # Emacs
    bind \ce end-of-line
    bind \ca beginning-of-line

end
