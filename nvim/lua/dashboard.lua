local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- Set header
dashboard.section.header.val = {
		
		"██╗    ██╗███████╗██╗      ██████╗ ██████╗ ███╗   ███╗███████╗",
		"██║    ██║██╔════╝██║     ██╔════╝██╔═══██╗████╗ ████║██╔════╝",
		"██║ █╗ ██║█████╗  ██║     ██║     ██║   ██║██╔████╔██║█████╗  ",
		"██║███╗██║██╔══╝  ██║     ██║     ██║   ██║██║╚██╔╝██║██╔══╝  ",
		"╚███╔███╔╝███████╗███████╗╚██████╗╚██████╔╝██║ ╚═╝ ██║███████╗",
		" ╚══╝╚══╝ ╚══════╝╚══════╝ ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝",
    "",
		"",
		"",
		
    "	  						██████╗ ███████╗███╗   ██╗",
		"		  					██╔══██╗██╔════╝████╗  ██║",
		"			  				██████╔╝█████╗  ██╔██╗ ██║",
		"				  			██╔═══╝ ██╔══╝  ██║╚██╗██║",
		"					  		██║     ███████╗██║ ╚████║",
		"						  	╚═╝     ╚══════╝╚═╝  ╚═══╝", 
}

-- Set menu
dashboard.section.buttons.val = {
    dashboard.button( "n", "  > New file" , ":ene <BAR> startinsert <CR>"),
    dashboard.button( "f", "  > Find file", ":cd $HOME/ | Telescope find_files<CR>"),
    dashboard.button( "r", "  > Recent"   , ":Telescope oldfiles<CR>"),
    dashboard.button( "s", "  > Settings" , ":e $MYVIMRC | :cd %:p:h | :Neotree<CR>"),
    dashboard.button( "q", "  > Quit NVIM", ":qa<CR>"),
}

-- footer 
dashboard.section.footer.val = {"where there is no struggle, there is no progress :)"}

-- Send config to alpha
alpha.setup(dashboard.opts)

-- Disable folding on alpha buffer
vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])
