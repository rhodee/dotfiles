let g:ale_linters = {'javascript': ['eslint']}

autocmd BufEnter *.{js,jsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx} :syntax sync clear
