local neotest = require('neotest')

neotest.setup({
  adapters = {
    require('neotest-plenary'),
    require('neotest-go'),
  },
})