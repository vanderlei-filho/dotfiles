return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {},
	keys = {
		{ "<leader>ff", "<cmd>FzfLua global<cr>", desc = "FzfLua global" },
		{ "<leader>fs", "<cmd>FzfLua live_grep_native<cr>", desc = "FzfLua live grep project" },
	},
}
