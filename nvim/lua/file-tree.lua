local status, neotree = pcall(require, "neo-tree")
if not status then
    vim.notify("not found neotree")
  return
end


-- require keybindings
neotree.setup({
	close_if_last_window = true,
	window = {
    position = "left",
    width = 25,
	},
})
