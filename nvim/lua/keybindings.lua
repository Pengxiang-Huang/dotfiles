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

-- quit windows
map("n", "<leader>qq", ":qa!<CR>", opt)

-- jump 5 lines 
map("n", "<C-j>", "5j", opt)
map("n", "<C-k>", "5k", opt)
map("v", "<C-j>", "5j", opt)
map("v", "<C-k>", "5k", opt)

-- map shift left and right
map("n", "<S-Left>", "b", opt)
map("n", "<S-Right>", "w", opt)

-- indent the code in v mode 
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)


-- move the line in v mode 
map("v", "J", ":move '>+1<CR>gv-gv", opt)
map("v", "K", ":move '<-2<CR>gv-gv", opt)

-- insert mode jump to the begin or end of the line
-- map("i", "<S-BS>", "<C-w>", opt) -- not working due to the match of the delete key 
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

-- map o insert a line below in n mode '
map("n", "o", "o<ESC>", opt)
map("n", "O", "O<ESC>", opt)
-- redo 
map("n", "<leader>r", "<C-r>", opt)


-- map the clear the highlight search
map("n", "<leader>cs", ":noh<CR>", opt)

--- Plugins Related Configurations

local pluginKeys = {}

-- neo tree 
map("n", "<leader>ft",  ":Neotree toggle<CR>", opt)

-- switch tab
map("n", "<leader><S-Left>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<leader><S-Right>", ":BufferLineCycleNext<CR>", opt)

-- close the tab
map("n", "<leader>ww", ":Bdelete!<CR>", opt)

-- close left or right buffer
map("n", "<leader>wh", ":BufferLineCloseLeft<CR>", opt)
map("n", "<leader>wl", ":BufferLineCloseRight<CR>", opt)

-- close others
map("n", "<leader>wo", ":BufferLineCloseRight<CR>:BufferLineCloseLeft<CR>", opt)

-- switch to the buffer number
map("n", "<leader>1", ":BufferLineGoToBuffer 1<CR>", opt)
map("n", "<leader>2", ":BufferLineGoToBuffer 2<CR>", opt)
map("n", "<leader>3", ":BufferLineGoToBuffer 3<CR>", opt)
map("n", "<leader>4", ":BufferLineGoToBuffer 4<CR>", opt)
map("n", "<leader>5", ":BufferLineGoToBuffer 5<CR>", opt)
map("n", "<leader>6", ":BufferLineGoToBuffer 6<CR>", opt)
map("n", "<leader>7", ":BufferLineGoToBuffer 7<CR>", opt)
map("n", "<leader>8", ":BufferLineGoToBuffer 8<CR>", opt)
map("n", "<leader>9", ":BufferLineGoToBuffer 9<CR>", opt)

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

-- Telescope
-- find in current folder
map("n", "<leader>ff", ":Telescope find_files<CR>", opt)

-- global search 
map("n", "<leader>f/", ":Telescope live_grep<CR>", opt)


return pluginKeys
