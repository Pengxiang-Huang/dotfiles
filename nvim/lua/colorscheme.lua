vim.o.background = "dark"
-- onedark
local colorscheme = "onedark"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
  vim.notify("colorscheme: " .. colorscheme .. " Not Found!")
  return
end
