local cmp = require("cmp")

require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({
        select = true,
    }),
    ["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end, {"i", "s"}),

	["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end, {"i", "s"}),

    ["<C-e>"] = cmp.mapping.abort()
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
  }),
  performance = { max_view_entries = 5 },
  sorting = {
      comparators = {
          cmp.config.compare.kind,
          cmp.config.compare.sort_text,
      }
  }
})
