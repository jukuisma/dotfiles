if status is-interactive

    # Do not greet
    set -U fish_greeting

    if $GREET_ZPOOL
        zpool status -x
    end

end
