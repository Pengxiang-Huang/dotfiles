require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})

require("mason-lspconfig").setup({
  ensure_installed = { "clangd", "cmake"},
	automatic_enable = false,
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Diagnostics UI
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

-- Toggle diagnostics
local diagnostics_active = true
vim.keymap.set("n", "<leader>ec", function()
  diagnostics_active = not diagnostics_active
  if diagnostics_active then
    vim.diagnostic.enable()
  else
    vim.diagnostic.disable()
  end
end, { noremap = true, silent = true })

vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { noremap = true, silent = true })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { noremap = true, silent = true })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>el", vim.diagnostic.setloclist, { noremap = true, silent = true })

local on_attach = function(_, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
end

-- set up clangd 
vim.lsp.config("clangd", {
  capabilities = capabilities,
	on_attach = on_attach,
	-- install clangd first in local env 
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--completion-style=detailed",
    "--header-insertion=iwyu",
    "--header-insertion-decorators",
    "--pch-storage=memory",
		"--compile-commands-dir=build",
  },
})

-- set up cmake
vim.lsp.config("cmake", {
  capabilities = capabilities,
  on_attach = on_attach,
	-- install cmake first in local env 
	cmd = { "cmake-language-server" }
})

-- enable clangd cmake
vim.lsp.enable({ "clangd", "cmake" })
