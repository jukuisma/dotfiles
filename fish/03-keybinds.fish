if status is-interactive
    # Clear terminal and repaint after exiting tmux to avoid buggy behavior
    bind \cf "tmux-sessionizer; clear; commandline -f repaint"
    bind \cY accept-autosuggestion
    bind -k nul accept-autosuggestion
end
