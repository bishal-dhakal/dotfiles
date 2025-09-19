return {
	"saghen/blink.cmp",
	version = "1.*", -- Use prebuilt binaries, no Rust required
	dependencies = {
		-- Optional snippet support
		{ "L3MON4D3/LuaSnip", lazy = true },
	},
	config = function()
		require("blink.cmp").setup({
			-- Fuzzy matching implementation (uses prebuilt binary)
			fuzzy = { implementation = "prefer_rust" },

			-- Enable plugin conditionally per buffer
			enabled = function()
				return not vim.tbl_contains({ "lua", "markdown" }, vim.bo.filetype)
			end,

			-- Disable cmdline completions
			cmdline = { enabled = false },

			completion = {
				keyword = { range = "full" }, -- Fuzzy match full range
				accept = { auto_brackets = { enabled = false } },
				list = { selection = { preselect = false, auto_insert = true } },
				menu = {
					auto_show = false,
					draw = {
						columns = {
							{ "label", "label_description", gap = 1 },
							{ "kind_icon", "kind" },
						},
					},
				},
				documentation = { auto_show = true, auto_show_delay_ms = 500 },
				ghost_text = { enabled = true },
			},

			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},

			snippets = { preset = "luasnip" },

			signature = { enabled = true },
		})
	end,
}
