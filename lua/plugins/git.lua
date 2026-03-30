return {
	{
		"tpope/vim-fugitive",
	},
	{
		"tpope/vim-rhubarb",
		config = function()
			-- nvim tree disables netrw, which prevents GBrowse to work
			vim.g.nvim_tree_disable_netrw = 0
			vim.keymap.set("n", "<leader>gho", ":.GBrowse<CR>", {})
		end,
	},
	{
		"f-person/git-blame.nvim",
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
			vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})
		end,
	},
	-- I'm controlling lazy git with tmux so that it appears over the entire screen, not just in the current buffer or pane. This is controlled in .tmux.conf
	-- {
	-- 	"folke/snacks.nvim",
	-- 	config = function()
	-- 		local Snacks = require("snacks")
	-- 		vim.keymap.set("n", "<leader>lg", function()
	-- 			Snacks.lazygit.open()
	-- 		end)
	-- 		vim.keymap.set("n", "<leader>lf", function()
	-- 			Snacks.lazygit.log_file()
	-- 		end)
	-- 	end,
	-- 	opts = {
	-- 		lazygit = {
	-- 			-- your lazygit configuration comes here
	-- 			-- or leave it empty to use the default settings
	-- 			-- refer to the configuration section below
	-- 		},
	-- 	},
	-- },
}
