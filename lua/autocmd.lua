local autocmd = vim.api.nvim_create_autocmd

-- format on save
autocmd("BufWritePre", {
	pattern = "",
	callback = function()
		if vim.bo.filetype ~= "oil" then
			vim.lsp.buf.format()
		end
	end,
})
-- from https://neovim.io/doc/user/lua-guide.html#lua-guide-autocommand-create
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	desc = "Briefly highlight yanked text",
})
