require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require('mason-lspconfig').setup({
    ensure_installed = { 'clangd', 'rust_analyzer', },
})


local opts = { noremap = true, silent = true }

-- defeine diagnostic sign
vim.diagnostic.config({
  virtual_text = true,  -- show inline text
	signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "✘", -- or " "
      [vim.diagnostic.severity.WARN]  = " ", -- or "▲ "
      [vim.diagnostic.severity.HINT]  = "⚑", -- or " "
      [vim.diagnostic.severity.INFO]  = "", -- or " "
    },
	}
})

-- error handling
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '<leader>ec', vim.diagnostic.hide, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<leader>el', vim.diagnostic.setloclist, opts)


-- lsp config
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
