return {
	"stevearc/oil.nvim",
	opts = {},
	-- Optional dependencies
	dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
	config = function()
		require("oil").setup({
			view_options = {
				show_hidden = true,
			},
		})
    -- https://github.com/stevearc/oil.nvim?tab=readme-ov-file#options
		vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
		vim.keymap.set("n", "<leader>-", require("oil").toggle_float, { desc = "Open parent directory in float" })
	end,
}
