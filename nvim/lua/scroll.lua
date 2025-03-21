require('neoscroll').setup({
})

-- local keymap 
neoscroll = require('neoscroll')
local keymap = {
  ["<S-Up>"] = function() neoscroll.ctrl_u({ duration = 450 }) end;
  ["<S-Down>"] = function() neoscroll.ctrl_d({ duration = 450 }) end;
}
local modes = { 'n', 'i', 'v', 'x' }
for key, func in pairs(keymap) do
  vim.keymap.set(modes, key, func)
end
