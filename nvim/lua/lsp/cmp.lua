local cmp = require("cmp")

cmp.setup({
  completion = {
    -- Recommended completion behavior
    completeopt = "menu,menuone,noinsert,noselect",
  },

  mapping = cmp.mapping.preset.insert({
    -- Trigger completion menu
    ["<C-Space>"] = cmp.mapping.complete(),

    -- Close completion
    ["<C-c>"] = cmp.mapping.abort(),

		-- last one 
		["<Up>"] = cmp.mapping.select_prev_item(),

		-- next one 
		["<Down>"] = cmp.mapping.select_next_item(),

		-- tab to confirm 
		["<Tab>"] = cmp.mapping.select_next_item(),

		["<CR>"] = cmp.mapping.confirm({
				select = true,
				behavior = cmp.ConfirmBehavior.Replace
		}),

  }),

  sources = {
    { name = "nvim_lsp" },
		{ name = "buffer"   },
  },
})

cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "path" },
  }, {
    { name = "cmdline" },
  }),
})
