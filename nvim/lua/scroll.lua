require('neoscroll').setup({
    -- Set any options as needed
})

local t = {}
-- Syntax: t[keys] = {function, {function arguments}}
t['<S-Up>'] = {'scroll', {'-vim.wo.scroll', 'true', '350'}}
t['<S-Down>'] = {'scroll', { 'vim.wo.scroll', 'true', '350'}}

require('neoscroll.config').set_mappings(t)
