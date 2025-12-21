local ok, ibl = pcall(require, "ibl")
if not ok then
  vim.notify("ibl (indent-blankline) not found")
  return
end

ibl.setup({
  indent = {
    char = "¦",
    tab_char = "¦",
  },
  scope = {
    enabled = true,
    show_start = true,
    show_end = false,
  },
})
