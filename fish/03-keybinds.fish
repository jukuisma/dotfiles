if status is-interactive

    # Bind C-f to run tmux-sessionizer in both normal and insert modes.
    # Clear terminal and repaint after exiting tmux to avoid buggy behavior.
    bind \cf --mode default "tmux-sessionizer; clear; commandline -f repaint"
    bind \cf --mode insert "tmux-sessionizer; clear; commandline -f repaint"

    # Bind C-y and C-space to accept autosuggestions.
    bind \cy --mode insert accept-autosuggestion
    bind -k --mode insert nul accept-autosuggestion

    # Emacs
    bind --mode insert \ce end-of-line
    bind --mode insert \ca beginning-of-line

end
