local status, ibl = pcall(require, "indent_blankline")
if not status then
  vim.notify(" not found indent_blankline")
  return
end

require("ibl").setup({
	indent = { char = '¦' },
})
