local status, lualine = pcall(require, "lualine")
if not status then
    vim.notify("not found lualine")
  return
end

lualine.setup({
  options = {
    component_separators = { left = "|", right = "|" },
    section_separators = { left = " ", right = "" },
		theme = 'onedark',
  },
  extensions = { "neo-tree", "toggleterm" },
  sections = {
		lualine_b = {"branch"},
    lualine_c = {
      "filename",
      {
        "lsp_progress",
        spinner_symbols = { " ", " ", " ", " ", " ", " " },
      },
    },
    lualine_x = {
      "filesize",
      {
        "fileformat",
      }, 
		},
--		lualine_z = { "location" }, 
  },
})

