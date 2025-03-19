return {
	"nvim-lualine/lualine.nvim",
	config = function()
		-- lualine docs - https://github.com/nvim-lualine/lualine.nvim
		-- show full filename in status bar - https://www.reddit.com/r/neovim/comments/16s1xky/comment/k27nf6g/
		local function filename()
			return "%F"
		end
		-- from https://www.reddit.com/r/neovim/comments/xy0tu1/comment/irfegvd/
		-- I'm hiding the status line in vim-options, but this will hide macro recording. This config
		-- will show macro recording in the status line. This has some delay, so there is additional config
		-- in the reddit post to get UI updates quicker
		local function show_macro_recording()
			local recording_register = vim.fn.reg_recording()
			if recording_register == "" then
				return ""
			else
				return "Recording @" .. recording_register
			end
		end
		local function buffer_count()
			local mod = vim.fn.len(vim.fn.getbufinfo({ bufmodified = 1 }))
			return "Mod:" .. mod
		end
		require("lualine").setup({
			options = {
				theme = "dracula",
			},
			sections = {
				lualine_b = {},
				lualine_c = { filename },
				lualine_x = { show_macro_recording },
				lualine_y = { buffer_count, "filetype" },
				lualine_z = {},
			},
		})
	end,
}
