require('neotest').setup({
  adapters = {
    require('neotest-plenary'),
    require('neotest-go'),
    require('neotest-rust'),
  },
})