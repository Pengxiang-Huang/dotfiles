local status, nvim_tree = pcall(require, "nvim-tree")
if not status then
    vim.notify("not found nvim-tree!")
  return
end


-- require keybindings
local list_keys = require('keybindings').nvimTreeList
nvim_tree.setup({
    
		-- show the git status 
    git = {
        enable = true,
    },
    
		-- hide dotfiles 
    filters = {
        dotfiles = true,
    },
    view = {
        
        width = 25,
        
        side = 'left',
        
        number = false,
        relativenumber = false,
       
				-- show icons 
        signcolumn = 'yes',
    },
    actions = {
        open_file = {
            
            resize_window = true,
            
            quit_on_open = true,
        },
    },
    
})
-- 自动关闭
vim.cmd([[
  autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
]])
