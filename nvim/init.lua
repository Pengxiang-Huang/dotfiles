-- personal configuration

-- basic vim settings
require('basic')

-- entry points for all the plugins
require('plugins')

-- keybindings for basic and plugins configurations
require('keybindings')

--- plugins 
require('colorscheme')

require('file-tree')

-- to fancy..
require('highlight')

require('buffer')

require('status')

require('whichkey')

require('lsp.setup')

require('lsp.cmp')

require('indent')

require('word')

require('save')

require('comment-tool')

require('scroll')

require('pair')

require('file-fuzzy')

require('dashboard')
-- not used 
-- require('format')
