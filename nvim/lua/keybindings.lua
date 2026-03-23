-- basic vim bindings

-- modes: 
-- v, i, n visual block = x
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

-- jump 10 lines 
map("n", "<C-j>", "5j", opt)
map("n", "<C-k>", "5k", opt)
map("v", "<C-j>", "5j", opt)
map("v", "<C-k>", "5k", opt)

-- move 5 words
map("n", "<C-h>", "5b", opt)
map("n", "<C-l>", "5w", opt)
map("v", "<C-h>", "5b", opt)
map("v", "<C-l>", "5w", opt)

-- shift left and right jump between words
map("n", "<S-Left>", "b", opt)
map("n", "<S-Right>", "w", opt)

-- begin of line and end of line 
map("n", "H", "0", opt)
map("n", "L", "$", opt)

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

-- Tab + hjkl to jump between windows
map("n", "<tab>h", "<C-w>h", opt)
map("n", "<tab>j", "<C-w>j", opt)
map("n", "<tab>k", "<C-w>k", opt)
map("n", "<tab>l", "<C-w>l", opt)

-- map jump newer since its shadowed by <tab>hjkl
map("n", "<C-n>", "<C-i>", opt)

-- <leader> + Tab  to jump to the next window
map("n", "<leader><tab>", "<C-w>w", opt)

-- map the jj to jump back to the normal mode
map("i", "jj", "<ESC>", opt)

-- map o insert a line below in n mode '
map("n", "o", "o<ESC>", opt)
map("n", "O", "O<ESC>", opt)

-- map the insert char in normal mode 
map("n", "<leader>a", ":execute 'normal! a' . getcharstr()<CR>", opt)

-- map the clear the highlight search
map("n", "<leader>cs", ":noh<CR>", opt)

-- copy a single line to the system clipboard
map("n", "<leader>cl", ":yy<CR>", opt)

-- copy the entire file to the system clipboard 
map("n", "<leader>cf", ":%y+<CR>", opt)


--- Plugins Related Configurations

local pluginKeys = {}

-- neo tree 
map("n", "<leader>ft",  ":Neotree toggle<CR>", opt)

function ReplaceGlobally()

		local old_word = vim.fn.expand("<cword>")

    if old_word == "" then
        print("No text selected.")
        return
    end

    -- Prompt user for the new replacement text
    local new_word = vim.fn.input("Replace " .. old_word .. " with: ")

    if new_word == "" then
        print("Replacement aborted.")
        return
    end

    -- Perform global substitution
    vim.cmd("%s/\\<" .. vim.pesc(old_word) .. "\\>/" .. vim.pesc(new_word) .. "/g")
end

-- replace buffer
map("n", "<leader>rw", ":lua ReplaceGlobally()<CR>", opt)

-- paste from system clipboard, used inside tmux
function PasteFromClipboard()
	local lines = vim.fn.systemlist('pbpaste')
	if #lines > 0 then
		vim.api.nvim_put(lines, 'c', true, true)
	end
end 

-- used inside tmux 
map("n", "<leader>p", ":lua PasteFromClipboard()<CR>", opt)

-- Telescope
-- find in current folder
map("n", "<leader>ff", ":Telescope find_files<CR>", opt)

-- global search 
map("n", "<leader>fg", ":Telescope live_grep<CR>", opt)

-- find methods/functions/symbols
map("n", "<leader>fs", ":Telescope lsp_document_symbols<CR>", opt)

-- find buffer 
map("n", "<leader>fb", ":Telescope current_buffer_fuzzy_find<CR>", opt)

-- map the terminal 
map("n", "<leader>tt", ":ToggleTerm direction=float<CR>", opt)

-- map the esc for the terminal 
map("t", "<ESC>", "<C-\\><C-n>", opt)

return pluginKeys
