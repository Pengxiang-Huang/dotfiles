-- basic vim configurations

-- set utf8
vim.g.encoding = "UTF-8"
vim.o.fileencoding = 'utf-8'

-- set the auto read when file is changed outside
vim.o.autoread = true
vim.bo.autoread = true

-- set the scrolloff to 8
vim.o.scrolloff = 6

-- highlight current line
vim.o.cursorline = true

-- disable the annoying sound on errors
vim.o.errorbells = false

-- use system clipboard
vim.o.clipboard = 'unnamedplus'

-- set the tab == 2 spaces
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.softtabstop = 2

-- disable the wrap line
vim.wo.wrap = false

-- set the sign column
-- vim.wo.signcolumn = "yes"

-- always open help in vertical screen
vim.api.nvim_command('autocmd! FileType help wincmd L')

-- set the window numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- windows split
vim.opt.splitright = true

-- search while typing
vim.o.incsearch = true

-- set command line height to 2
vim.o.cmdheight = 1

-- enable mouse at visual and insert mode
vim.o.mouse = "vi"

-- set the timeout line to 500 ms
vim.o.timeoutlen = 500

-- show the tabline
vim.o.showtabline = 2

-- set the auto indent
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.smartindent = true

-- set to OSC 52 so can be copied via ssh
vim.g.clipboard = {
	name = 'OSC 52',
	copy = {
		['+'] = require('vim.ui.clipboard.osc52').copy('+'),
		['*'] = require('vim.ui.clipboard.osc52').copy('*'),
	},
	paste = {
		['+'] = require('vim.ui.clipboard.osc52').paste('+'),
		['*'] = require('vim.ui.clipboard.osc52').paste('*'),
	},
}

-- hide tmux status when open vim
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.fn.system("tmux set-option status off")
  end
})

-- show tmux status when exit vim
vim.api.nvim_create_autocmd("VimLeave", {
  callback = function()
    vim.fn.system("tmux set-option status on")
  end
})

-- remember the last edit posistion
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local line_count = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= line_count then
      vim.api.nvim_win_set_cursor(0, mark)
    end
  end,
})

-- remove trailing space on save
vim.api.nvim_create_autocmd("BufWritePre", {
  desc = "Removes trailing whitespace on save",
  callback = function()
    local save_cursor = vim.fn.getpos(".")
    vim.cmd([[%s/\s\+$//e]])
    vim.fn.setpos(".", save_cursor)
  end,
})
