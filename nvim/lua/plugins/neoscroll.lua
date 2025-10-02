return {
	"karb94/neoscroll.nvim",
	opts = {},
	config = function()
		require("neoscroll").setup()

		local neoscroll = require("neoscroll")

		-- Set up keymaps for Shift + Arrow keys
		vim.keymap.set("n", "<S-Up>", function()
			neoscroll.scroll(-vim.wo.scroll, true, 100)
		end)

		vim.keymap.set("n", "<S-Down>", function()
			neoscroll.scroll(vim.wo.scroll, true, 100)
		end)
	end,
}
