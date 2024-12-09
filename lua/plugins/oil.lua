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
			-- default preview split is left for none floating preview. If I want to set this to the right,
			-- I can follow what is done here -- https://github.com/stevearc/oil.nvim/issues/454#issuecomment-2244100893
			float = {
				preview_split = "right",
			},
		})
		-- https://github.com/stevearc/oil.nvim?tab=readme-ov-file#options
		vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
		vim.keymap.set("n", "<leader>-", require("oil").toggle_float, { desc = "Open parent directory in float" })
		-- oil disables netrw, which breaks rhubarb/GBrowse/open file in github functionality
		-- https://vi.stackexchange.com/a/43348
		vim.api.nvim_create_user_command("Browse", function(opts)
			vim.fn.system({ "open", opts.fargs[1] })
		end, { nargs = 1 })
	end,
}
