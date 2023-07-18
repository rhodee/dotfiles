return {
    { 'nvim-neotest/neotest-plenary' },
    {
        'nvim-neotest/neotest',
        opts = {
            adapters = {
                'neotest-plenary',
                'neotest-rust',
                'nvim-neotest/neotest-go',
            },
        },
    },
}