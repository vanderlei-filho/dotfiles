return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			filesystem = {
				filtered_items = {
					visible = true, -- Show hidden files
					show_hidden = true, -- Specifically show dotfiles
					hide_dotfiles = false, -- Disable hiding dotfiles
					hide_gitignored = false, -- Optionally show git-ignored files
				},
			},
		})
		vim.keymap.set("n", "<leader>ee", ":Neotree filesystem toggle left<CR>", { desc = "Open cwd file tree" })
	end,
}
