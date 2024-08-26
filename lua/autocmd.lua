-- local autocmd = vim.api.nvim_create_autocmd

-- format on save
-- autocmd("BufWritePre", {
--   pattern = '',
--   callback = function()
--     vim.lsp.buf.format()
--   end,
-- })
-- from https://neovim.io/doc/user/lua-guide.html#lua-guide-autocommand-create
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function() vim.highlight.on_yank() end,
  desc = "Briefly highlight yanked text"
})
