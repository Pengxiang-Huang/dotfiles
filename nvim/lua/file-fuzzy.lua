local status, telescope = pcall(require, "telescope")
if not status then
  vim.notify("not found telescope")
  return
end

telescope.setup({
  defaults = {
    initial_mode = "insert",
  },
  pickers = {
    find_files = {
      theme = "dropdown", 
    }
  },
  extensions = {
  },
})


