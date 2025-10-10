let s:plugin_dir = expand('~/.vim/bundle')

" Clone a repo at startup if it doesn't exist
function! s:ensure(repo)
  let name = split(a:repo, '/')[-1]
  let path = s:plugin_dir . '/' . name

  if !isdirectory(path)
    if !isdirectory(s:plugin_dir)
      call mkdir(s:plugin_dir, 'p')
    endif
    execute '!git clone --depth=1 https://github.com/' . a:repo . ' ' . shellescape(path)
  endif

  execute 'set runtimepath+=' . fnameescape(path)
endfunction

call s:ensure('jukuisma/vim-argwrap')
call s:ensure('jukuisma/fzf')
call s:ensure('jukuisma/fzf.vim')
call s:ensure('jukuisma/vim-commentary')
call s:ensure('jukuisma/vim-fugitive')
call s:ensure('jukuisma/vim-repeat')
call s:ensure('jukuisma/vim-surround')
call s:ensure('jukuisma/catppuccin-nvim')
call s:ensure('jukuisma/vim-airline')
call s:ensure('jukuisma/vim-airline-themes')
