let g:ale_linters = {'typescript': ['eslint']}
let g:yats_host_keyword = 1

autocmd BufEnter *.{ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{ts,tsx} :syntax sync clear
