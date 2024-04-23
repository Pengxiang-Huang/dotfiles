-- basic vim configurations

-- set utf8
vim.g.encoding = "UTF-8"
vim.o.fileencoding = 'utf-8'

-- set the auto read when file is changed outside
vim.o.autoread = true
vim.bo.autoread = true

-- set the scrolloff to 8
vim.o.scrolloff = 6

-- hightlight current line 
vim.o.cursorline = true

-- disable the annoying sound on errors
vim.o.errorbells = false

-- use system clipboard
vim.o.clipboard = 'unnamedplus'

-- set the tab == 2 spaces
vim.o.shiftwidth = 2
vim.o.tabstop = 2

-- disable the wrap line
vim.wo.wrap = false

-- set the sign column
-- vim.wo.signcolumn = "yes"

-- set the window numbers
vim.opt.number = true
vim.opt.relativenumber = false

-- search while typing
vim.o.incsearch = true

-- set command line height to 2
vim.o.cmdheight = 2

-- enable mouse at all 
vim.o.mouse = "vi"

-- set the timeout line to 500 ms
vim.o.timeoutlen = 500

-- show the tabline 
vim.o.showtabline = 2

-- set the auto indent
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.smartindent = true
