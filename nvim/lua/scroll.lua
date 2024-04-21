require('neoscroll').setup({
    -- Set any options as needed
})

local t = {}
-- Syntax: t[keys] = {function, {function arguments}}
t['<S-Up>'] = {'scroll', {'-0.38', 'false', '100'}}
t['<S-Down>'] = {'scroll', { '0.38', 'false', '100'}}
t['zt']    = {'zt', {'250'}}
t['zz']    = {'zz', {'250'}}
t['zb']    = {'zb', {'250'}}

require('neoscroll.config').set_mappings(t)
