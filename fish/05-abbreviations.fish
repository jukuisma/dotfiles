if status is-interactive

    # Git
    abbr --add ga git add
    abbr --add gb git blame
    abbr --add gc git commit
    abbr --add gco git checkout
    abbr --add gd git diff
    abbr --add gl git log
    abbr --add gm git merge
    abbr --add gp git pull
    abbr --add gpu git push
    abbr --add grb git rebase
    abbr --add grs git reset
    abbr --add gs git status
    abbr --add gsh git show

    # Tmux
    abbr --add t tmux
    abbr --add ta tmux attach
    abbr --add tl tmux ls
    abbr --add ts tmux-sessionizer
    abbr --add tks tmux kill-server

    # Vim
    abbr --add vim nvim
    abbr --add vi nvim
    abbr --add v nvim
    abbr --add vim! /usr/bin/vim
    abbr --add vi! /usr/bin/vim
    abbr --add v! /usr/bin/vim
    abbr --add vimb nvim -b
    abbr --add vimd nvim -d

    # Misc
    abbr --add ccat batcat
    abbr --add c clear
    abbr --add clipnt wl-copy -c
    abbr --add connect-xm5 bluetoothctl connect $XM5_UUID
    abbr --add disconnect-xm5 bluetoothctl disconnect $XM5_UUID
    abbr --add rtop radeontop -c
    abbr --add j sudo journalctl
    abbr --add s sudo systemctl

end