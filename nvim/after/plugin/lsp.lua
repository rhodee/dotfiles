local lsp = require('lsp-zero')

local status, lsp_lines = pcall(require, 'lsp_lines')
if (not status) then return end

lsp_lines.setup({})
vim.diagnostic.config({ virtual_text = false })

lsp.preset('recommended')

lsp.ensure_installed({
	'bashls',
	'cmake',
	'cssls',
	'dockerls',
	'eslint',
	'gopls',
	'graphql',
	'html',
	'jsonls',
	'jdtls',
	'pyright',
	'rust_analyzer',
	'sqlls',
	'terraformls',
	'tsserver',
	'yamlls',
})

lsp.set_preferences({
  autotag = {
    enable = true
  },
  context_commentstring = {
    enable = true
  },
  fold = {
    enable = true
  },
  highlight = {
    enable = true,
    use_languagetree = true,
    additional_vim_regex_highlighting = false,
  },
  incremental_selection = {
    enable = true,
  },
  -- indent {
  --   enable = true
  -- },
  matchup = {
    enable = true,
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = 1500,
  },
  separator = '-',
})

-- Fix Undefined global 'vim'
lsp.configure('sumneko_lua', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})


local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ['<C-Space>'] = cmp.mapping.complete(),
})

-- disable completion with tab
-- this helps with copilot setup
cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  if client.name == 'eslint' then
      vim.cmd.LspStop('eslint')
      return
  end

  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', '<leader>ws', vim.lsp.buf.workspace_symbol, opts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', '<leader>rr', vim.lsp.buf.references, opts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, opts)
  vim.keymap.set('i', '<C-h>', vim.lsp.buf.signature_help, opts)
  vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
  vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
})

