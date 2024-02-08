local autocmd = vim.api.nvim_create_autocmd

-- format on save
autocmd("BufWritePre", {
  pattern = '',
  callback = function()
    vim.lsp.buf.format()
  end,
})
