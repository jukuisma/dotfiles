if status is-interactive

    # Git
    abbr --add ga git add
    abbr --add gb git blame
    abbr --add gc git commit
    abbr --add gco git checkout
    abbr --add gd git diff
    abbr --add bd batdiff
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
    abbr --add vim! $BIN/vim
    abbr --add vi! $BIN/vim
    abbr --add v! $BIN/vim
    abbr --add vimb nvim -b
    abbr --add vimd nvim -d
    abbr --add vimt nvim -t

    # Misc
    abbr --add activate source venv/bin/activate.fish
    abbr --add c clear
    abbr --add clipnt wl-copy -c
    abbr --add connect-xm5 bluetoothctl connect $XM5_UUID
    abbr --add disconnect-xm5 bluetoothctl disconnect $XM5_UUID
    abbr --add rtop radeontop -c
    abbr --add j sudo journalctl
    abbr --add s sudo systemctl
    abbr --add od objdump -M intel -D
    abbr --add ct ctags -R \*
    abbr --add sshp ssh -o PreferredAuthentications=password

end
