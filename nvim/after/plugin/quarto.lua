local quarto = require'quarto'

quarto.setup {
    lspFeatures = {
        enabled = true,
        languages = { 'r', 'python', 'julia' },
        chunks = 'curly',
        diagnostics = {
            enabled = true,
            triggers = { "BufWrite" }
        },
        completion = {
            enabled = true
        }
    }
}

vim.keymap.set('n', '<leader>qp', quarto.quartoPreview, {silent = true, noremap = true})

