return {
	"rcarriga/nvim-notify",
	config = function()
		vim.notify = require("notify")
		vim.notify("Welcome to your Text Editor")
	end,
}
