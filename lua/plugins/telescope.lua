return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-live-grep-args.nvim",
				-- This will not install any breaking changes.
				-- For major updates, this must be adjusted manually.
				version = "^1.0.0",
			},
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},

		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
			vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
			vim.keymap.set("n", "<leader>mp", builtin.man_pages, {})
			vim.keymap.set("n", "<leader>rg", builtin.registers, {})
			vim.keymap.set("n", "<leader>fz", builtin.current_buffer_fuzzy_find, {})
			vim.keymap.set("n", "<leader>sh", builtin.search_history, {})
			vim.keymap.set("n", "<leader>ch", builtin.command_history, {})
			vim.keymap.set("n", "<leader>km", builtin.keymaps, {})
			vim.keymap.set("n", "<leader>qf", builtin.quickfix, {})
			vim.keymap.set("n", "gr", function()
				builtin.lsp_references({
					include_declaration = false,
					-- I'm generally more interested in which file a reference is in than the LOC
					-- though this usually applies to Segway rather than other smaller codebases
					fname_width = 70,
				})
			end, {})

			-- live_grep_args driven commands
			-- https://github.com/nvim-telescope/telescope-live-grep-args.nvim?tab=readme-ov-file#shortcut-functions
			local lga_shortcuts = require("telescope-live-grep-args.shortcuts")
			vim.keymap.set("n", "<leader>fs", lga_shortcuts.grep_word_under_cursor)
			vim.keymap.set(
				"n",
				"<leader>fg",
				":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>"
			)

			local telescope = require("telescope")
			local actions = require("telescope.actions")
			local layout_actions = require("telescope.actions.layout")
			local lga_actions = require("telescope-live-grep-args.actions")

			telescope.setup({
				defaults = {
					layout_strategy = "flex",
					layout_config = {
						width = 0.95,
						height = 0.95,
					},
					prompt_prefix = "🔍 ",
					mappings = {
						i = {
							["<C-p>"] = layout_actions.toggle_preview,
						},
					},
					preview = {
						hide_on_startup = true,
					},
				},
				pickers = {
					find_files = {
						find_command = { "rg", "--files", "--hidden", "-g", "!.git" },
					},
				},
				extensions = {
					live_grep_args = {
						-- https://github.com/nvim-telescope/telescope-live-grep-args.nvim?tab=readme-ov-file#configuration
						mappings = { -- extend mappings
							i = {
								["<C-k>"] = lga_actions.quote_prompt(),
								["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
								-- freeze the current list and start a fuzzy search in the frozen list
								["<C-space>"] = actions.to_fuzzy_refine,
							},
						},
					},
				},
			})

			telescope.load_extension("live_grep_args")
		end,
	},

	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
