vim.o.background = "dark"

-- local colorscheme
local color = "onedark"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. color)

if not status_ok then
  vim.notify("colorscheme: " .. colorscheme .. " Not Found!")
  return
end
