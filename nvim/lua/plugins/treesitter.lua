return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			ensure_installed = {
				"lua",
				"javascript",
				"typescript",
				"python",
				"svelte",
				"html",
				"json",
				"yaml",
				"bash",
				"dockerfile",
				"vim",
				"css",
				"markdown",
				"markdown_inline",
				"tsx",
			},
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
