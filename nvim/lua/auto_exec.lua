local api = vim.api
local exec = api.nvim_exec

exec(
  [[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]],
  false
)

-- Go
-- Format on save
exec([[ autocmd BufWritePre *.go :silent! lua require('go.format').gofmt() ]], false)

-- Import on save
exec([[ autocmd BufWritePre *.go :silent! lua require('go.format').goimport() ]], false)
