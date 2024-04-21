local status, null_ls = pcall(require, "null-ls")
if not status then
  vim.notify("not found null-ls")
  return
end

local formatting = null_ls.builtins.formatting


local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.completion.spell,
    },
})
