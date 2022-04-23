local luasnip = require('luasnip')

luasnip.config.setup({
  ext_opts = {
    [require('luasnip.util.types').choiceNode] = {
      active = {
        virt_text = { { '●', 'LspDiagnosticsSignInformation' } },
      },
    },
  },
})