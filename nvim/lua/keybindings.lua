-- basic vim bindings

-- modes: 
-- v, i, n
-- visual block = x
-- term mode = t
-- command mode = c


-- leader key set to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "


local opt ={
	noremap = true,
	silent = true,
}

local map = vim.api.nvim_set_keymap

-- save files 
map("n", "<leader>w", ":w<CR>", opt)
map("n", "<leader>wq", ":wqa!<CR>", opt)

-- jump 5 lines 
map("n", "<C-j>", "5j", opt)
map("n", "<C-k>", "5k", opt)
map("v", "<C-j>", "5j", opt)
map("v", "<C-k>", "5k", opt)

-- indent the code in v mode 
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)


-- move the line in v mode 
map("v", "J", ":move '>+1<CR>gv-gv", opt)
map("v", "K", ":move '<-2<CR>gv-gv", opt)

-- insert mode jump to the begin or end of the line
-- map("i", "<S-Delete>", "<C-w>", opt) -- not working due to the match of the delete key 
map("i", "<C-h>", "<ESC>I", opt)
map("i", "<C-l>", "<ESC>A", opt)

--- Window Operations
--- split the window
map("n", "s", "", opt)
map("n", "sv", ":vsp<CR>", opt)
map("n", "sh", ":sp<CR>", opt)

-- close current windows
map("n", "sc", "<C-w>c", opt)

-- close other windows
map("n", "so", "<C-w>o", opt) 

-- <leader> + hjkl to jump between windows
map("n", "<leader>h", "<C-w>h", opt)
map("n", "<leader>j", "<C-w>j", opt)
map("n", "<leader>k", "<C-w>k", opt)
map("n", "<leader>l", "<C-w>l", opt)
-- <leader> Tab to jump to the next window
map("n", "<leader><tab>", "<C-w>w", opt)

-- map the jj to jump back to the normal mode
map("i", "jj", "<ESC>", opt)


--- Plugins Related Configurations

local pluginKeys = {}

-- nvim-tree
map("n", "<leader>ft",  ":NvimTreeToggle<CR>", opt)

-- file tree shortcuts
pluginKeys.nvimTreeList = {
  
	-- open file or folder 
  -- { key = {"<CR>", "o", "<2-LeftMouse>"}, action = "edit" },
  
	-- open and split 
  { key = "v", action = "vsplit" },
  { key = "h", action = "split" },
  
	-- show dotfiles 
  { key = ".", action = "toggle_dotfiles" }, -- Hide (dotfiles)
  
	-- file operations
  { key = "<F5>", action = "refresh" },
  { key = "a", action = "create" },
  { key = "d", action = "remove" },
  { key = "r", action = "rename" },
  { key = "x", action = "cut" },
  { key = "c", action = "copy" },
  { key = "p", action = "paste" },
  { key = "s", action = "system_open" },
}

-- switch tab
map("n", "<leader>{", ":BufferLineCyclePrev<CR>", opt)
map("n", "<leader>}", ":BufferLineCycleNext<CR>", opt)

-- close the tab
map("n", "<leader>bc", ":Bdelete!<CR>", opt)

-- close left or right buffer
map("n", "<leader>bh", ":BufferLineCloseLeft<CR>", opt)
map("n", "<leader>bl", ":BufferLineCloseRight<CR>", opt)

-- close others
map("n", "<leader>bo", ":BufferLineCloseRight<CR>:BufferLineCloseLeft<CR>", opt)



-- nvim-cmp auto complete
pluginKeys.cmp = function(cmp)
    return {
        -- show the complete
        ["<A-.>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
        -- disable the complete
        ["<A-,>"] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close()
        }),
        -- last one 
        ["<Up>"] = cmp.mapping.select_prev_item(),
        -- next one 
        ["<Down>"] = cmp.mapping.select_next_item(),
				
        -- tab to confirm 
        ["<Tab>"] = cmp.mapping.confirm({
            select = true,
            behavior = cmp.ConfirmBehavior.Replace
        }),
				
			
        -- scorll if too many 
        ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), {"i", "c"}),
        ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), {"i", "c"}),
    }
end



return pluginKeys