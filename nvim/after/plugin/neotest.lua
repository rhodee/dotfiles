local status, neotest = pcall(require, 'neotest')
if not status then return end

neotest.setup({
  adapters = {
    require('neotest-plenary'),
    require('neotest-go'),
    require('neotest-rust'),
  },
})