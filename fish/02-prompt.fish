if status is-interactive

    # Slightly modified Astronaut prompt
    function fish_prompt --description 'Write out the prompt'

        set -l last_status $status
        set -l normal (set_color normal)
        set -l status_color (set_color brgreen)
        set -l cwd_color (set_color $fish_color_cwd)
        set -l vcs_color (set_color brpurple)
        set -l prompt_status ""

        # Since we display the prompt on a new line allow the directory names
        # to be longer.
        set -q fish_prompt_pwd_dir_length
        or set -lx fish_prompt_pwd_dir_length 0

        # Color the prompt differently when we're root
        if functions -q fish_is_root_user; and fish_is_root_user
            if set -q fish_color_cwd_root
                set cwd_color (set_color $fish_color_cwd_root)
            end
        end

        # Color the prompt differently on remote hosts
        if test "$SSH_CLIENT"
            set cwd_color (set_color $fish_color_cwd_root)
        end

        # Color the prompt in red on error
        if test $last_status -ne 0
            set status_color (set_color $fish_color_error)
            set prompt_status $status_color "[" $last_status "]" $normal
        end

        # Handle python virtual environments
        if test $VIRTUAL_ENV
            echo -n -s '╭─(venv) '
        else
            echo -n -s '╭─'
        end

        echo -n -s (prompt_login) ' ' $cwd_color (prompt_pwd) $vcs_color
        echo -s (fish_vcs_prompt) $normal ' ' $prompt_status
        echo -n -s '╰─➤' $status_color ' ' $normal

    end

end
