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
		lualine_b = {"filename"},
		lualine_c = {"searchcount"},
    lualine_x = {
      "filesize",
		},
		lualine_y = {"location",},
		lualine_z = {
			{
				"datetime",
				style = '%I:%M %p',
			}
		},
  },
})

